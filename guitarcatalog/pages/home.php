<?php
// Open Database
$db = init_sqlite_db('db/site.sqlite', 'db/init.sql');
// Get Records
$result = exec_sql_query($db, "SELECT * FROM guitars;");
$records = $result->fetchAll();

// Set and define max file size
define("MAX_FILE_SIZE", 1000000);

// Feedback Array Messages set to false
$upload_message = array(
  'too_large' => False,
  'general error' => False
);
$upload_array = array(
  'model' => '',
  'color' => '',
  'price' => '',
  'description' => ''
);

if (isset($_POST["insert"])){
  // Retrieve uploaded file info
  $upload = $_FILES['upload'];

    // Set form validity to true
  $form_valid = TRUE;

  $upload_array['model'] = trim($_POST['model']);
  $upload_array['year'] = trim($_POST['year']);
  $upload_array['color'] = trim($_POST['color']);
  $upload_array['price'] = trim($_POST['price']);
  $upload_array['description'] = trim($_POST['description']);

// Conditional for if the upload error is successful
  if ($upload['error'] == UPLOAD_ERR_OK) {

    // Retrieve name of file //
    $upload_file_name = basename($upload['name']);

    // Retrieve file ext
    $upload_file_ext = strtolower(pathinfo($upload_file_name, PATHINFO_EXTENSION));
  } else if (($upload['error'] ==                 UPLOAD_ERR_INI_SIZE) || ($upload['error'] == UPLOAD_ERR_FORM_SIZE)){
    $form_valid = False;
    $upload_message['too_large'] = True;
  };

  // Insert file upload into database
  if ($form_valid) {
    $result = exec_sql_query(
      $db,
      "INSERT INTO guitars (model, year, color, price, description, fileext ) VALUES (:model, :year, :color, :price, :description, :fileext)",
      array(
        ':model' => $upload_array['model'],
        ':year' =>  $upload_array['year'],
        ':color' => $upload_array['color'],
        ':price' => $upload_array['price'],
        ':description' => $upload_array['description'],
        ':fileext' => $upload_file_ext
      )
      );
    }
  };

  if ($result) {
    // Record the id of the last inserted upload //
    $record_id = $db->lastInsertId('id');

    // Build URL using record id and file extension //
    $upload_path = 'public/uploads' . $record_id . '.' .$upload_file_ext;

    // Move uploaded file into the uploads folder //
    if (move_uploaded_file($upload['tmp_name'], $upload_path) == False){
      error_log("Failed to store the uploaded file on the file server. Please confirm if file exists");
    }
  };
?>

<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1" />

  <title>Strings Catalog Home</title>
  <link rel = "stylesheet" type = "text/css" href = "/public/styles/home.css">
</head>
<h2>
  STRINGS
</h2>
<div class = "strings-title">The Guitar Catalog</div>

<header>
    <nav>
      <ul>
          <li><a href = "/">HOME</a></li>
          <li><a href = "/detail?<?php echo http_build_query(array('id' => $record['id'])); ?>">DETAIL</a></li>
      </ul>
    </nav>
</header>
<?php if (is_user_logged_in() && $is_admin){?>
<body>
  <div class = "main">
    <div class = "section">
      <?php
      foreach($records as $record){
      ?>
          <div class = "home">
            <img class = "model" id = "ibanez" src ="/public/uploads/<?php echo htmlspecialchars($record['id'] . '.' . $record['fileext'])?>" alt = "<?php echo htmlspecialchars($record['model']);?>">
            <a class = "model-link" href = "/detail?<?php echo http_build_query(array('id' => $record['id'])); ?>"><?php echo htmlspecialchars($record['model']);?> </a>
            <a class = "source" href = <?php echo $record['filesource'];?>>Source</a>
          </div>
          <?php } ?>
    </div>
  </div>
  <h2 class = "filter-title">CLICK A FILTER TAG:</h2>
    <div class = "tag-box">
      <div class = "tags">
        <?php
        $result2 = exec_sql_query($db,
        "SELECT * FROM tags;")->fetchAll();
        foreach ($result2 as $record){?>
        <a class = "tag-link" href = "/?<?php echo http_build_query(array(
          'tag' => $record['id']
        ));?>">#<?php echo htmlspecialchars($record['name']);?></a>

        <?php } ?>
      </div>
    </div>
    <div class="filter-row">
      <div class = "filtered-main">
        <?php
        $tag_id = $_GET['tag'];
        if ($tag_id){
          $result = exec_sql_query($db, "SELECT * FROM guitars INNER JOIN guitar_tags ON guitars.id = guitar_tags.guitar_id WHERE guitar_tags.tag_id = $tag_id");
          $records = $result->fetchAll();
          ?>
        <div class = "filtered">
          <?php foreach ($records as $record){ ?>
                  <img class = "model" id = "ibanez" src ="/public/uploads/<?php echo htmlspecialchars($record['guitar_id'] . '.' . $record['fileext'])?>" alt = "<?php echo htmlspecialchars($record['model']);?>">
                  <a class = "model-link1" href = "/detail?<?php echo http_build_query(array('id' => $record['guitar_id'])); ?>"><?php echo htmlspecialchars($record['model']);?></a>
          <?php } ?>
        </div>
        <?php } ?>
      </div>
    </div>

    <div class = "form-descr">
      <p class = "form-words1">Have a Guitar You Want to Sell?</p>
      <p class = "form-words">ENTER YOUR GUITAR INFO BELOW:</p>
    </div>
      <form class = "form" action = "/" id = "upload" method = "post" enctype = "multipart/form-data">
          <input type= "hidden" name = "MAX-FILE-SIZE" value = "<?php echo MAX_FILE_SIZE?>">
          <div class = "model">
            <label for = "guitar-name" >Model:</label>
            <input id = "guitar-name" type = "text" name = "model">
          </div>
          <div class = "color">
            <label for = "model-color" >Color:</label>
            <input id = "model-color" type = "text" name = "color">
          </div>
          <div class = "price">
            <label for = "cost" >Price:</label>
            <input id = "cost" type = "text" name = "price">
          </div>
          <div class = "year">
            <label for = "model-year" >Year:</label>
            <input id = "model-year" type = "text" name = "year">
          </div>
          <div class = "description">
            <label for = "descr" >Description:</label>
            <input id = "descr" type = "text" name = "description" size = "500" maxlength = "500">
          </div>
            <label for = "add-pic">Upload:</label>
            <input id = "add-pic" type = "file" name = "upload" accept = ".png,.jpg,.jpeg">
          <div class = "upload-button">
            <button type = "submit" name = "insert">Upload</button>
          </div>
      </form>
</body>
    <!-- Login Session Code -->
    <?php  }else{
     ?>
     <?php echo login_form('/', $session_messages);
     } ?>
</html>
