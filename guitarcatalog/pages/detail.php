<!-- SQL queries

guitar that matches the id and the query string parameter

in query id = id of guitar from home page, if choose id use id in WHERE clause -->
<?php
$db = init_sqlite_db('db/site.sqlite', 'db/init.sql');

$page = $_GET['id'];
$sort_param = $_GET['sort'];

$sql_select = "SELECT guitars.id AS 'guitar.id',
guitars.model AS 'guitar.model', guitars.fileext AS 'guitar.fileext', guitars.description AS 'guitar.description', guitars.price AS 'guitar.price', guitar_tags.tag_id AS 'guitar_tag.tag_id', guitar_tags.guitar_id AS 'guitar_tag.guitar_id'
FROM guitar_tags INNER JOIN guitars ON (guitar_tags.guitar_id = guitars.id)
LEFT OUTER JOIN tags ON (tags.id = guitar_tags.tag_id)";

$result = exec_sql_query($db,
"SELECT * FROM guitars;")->fetchAll();

$record = $result[0];

// $result2 = exec_sql_query($db,
// "SELECT * FROM guitar_tags INNER JOIN tags ON (guitar_tags.tag_id = tags.id) WHERE guitar_tags.guitar_id = $page;")->fetchAll();

// $record2 = $result2[0];


// sorting queries and conditionals //
if (in_array($sort_param, array('color', 'high', 'low', 'old', 'new'))){

    $sort_css[$sort_param] = 'active';
    if ($sort_param == 'color'){
        $sql_sort_field = 'color';
        $sql_order = 'ASC';
    } else if ($sort_param == 'high'){
        $sql_sort_field = 'price';
        $sql_order = 'DESC';
    } else if ($sort_param == 'low'){
        $sql_sort_field = 'price';
        $sql_order = 'ASC';
    } else if ($sort_param == 'old'){
        $sql_sort_field = 'year';
        $sql_order = 'ASC';
    } else if ($sort_param == 'new'){
        $sql_sort_field = 'year';
        $sql_order = 'DESC';
    }
    $sql_order_clause = $sql_select . ' ORDER BY ' . $sql_sort_field . ' ' . $sql_order;

        // build select query //
    $sql_select_query = $sql_select . $sql_order_clause . ';';

    // open database and get record
    $result3 = exec_sql_query($db, $sql_select_query)->fetchAll();
    $record3 = $result3[0];
}

// sort css class array //
$sort_css = array(
    'color' => '',
    'high'  => '',
    'low'   => '',
    'old'   => '',
    'new'   => ''
);

// When URL link is clicked //
if ($page) {
    $result = exec_sql_query($db,
    "SELECT * FROM guitars WHERE (id = $page)")->fetchAll();

    $record = $result[0];



    // $result = exec_sql_query($db,
    // "SELECT * FROM tags;")->fetchAll()
    // foreach (record as record) {
    //     a href = http_build_query (array(
    //         tag => record['id']
    //     )
    //     )
    // // }


    // Query SELECT * FROM guitars INNER JOIN guitar_tags ON (guitar_tags_guitar_id = guitars.id) WHERE guitar_tags.tag_id =
    $result2 = exec_sql_query($db,
    "SELECT * FROM guitar_tags INNER JOIN tags ON (guitar_tags.tag_id = tags.id) WHERE guitar_tags.guitar_id = $page;")->fetchAll();

    $record2 = $result2[0];
  };

?>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1" />

  <title>Explore</title>
  <link rel = "stylesheet" type = "text/css" href = "/public/styles/home.css">
</head>
<h2>
  STRINGS
</h2>
<header>
    <nav>
      <ul>
          <li><a href = "/">HOME</a></li>
          <li><a href = "/detail?<?php echo http_build_query(array('id' => $record['id'])); ?>">DETAIL</a></li>
      </ul>
    </nav>
</header>
<!-- Issue: Can't seem to echo out the tag information for each record. I have the guitar tags selected and joined with the tags table but don't know how to echo out the actual name of the tag for each record (fixed)-->
    <div>
        <div class = "detail">
        <?php foreach ($result as $record) {?>
            <img src = "/public/uploads/<?php echo htmlspecialchars($record['id'] . '.' . $record['fileext']); ?>" class = "full-pic" alt = "Model">
            <div class = "detail-block">
                <div class = "detail-model">
                    <p class = "detail-label">MODEL:</p>
                    <?php echo htmlspecialchars($record['model']);?>
                </div>
                <div class = "detail-year">
                    <p class = "detail-label">YEAR:</p>
                    <?php echo htmlspecialchars($record['year']);?>
                </div>
                <div class = "detail-price">
                    <p class = "detail-label">PRICE:</p>
                    <?php echo htmlspecialchars($record['price']);?>
                </div>

                <div class = "detail-description">
                    <p class = "detail-label">DESCRIPTION:</p>
                    <?php echo htmlspecialchars($record['color']);?>
                    <?php echo htmlspecialchars($record['description'])?>
                </div>

                <div class ="detail-review">

                <p class = "detail-label">REVIEW:</p>
                    <div class = "review">
                        <?php echo htmlspecialchars($record['reviews'])?>
                    </div>
                </div>
            </div>
        <?php } ?>
        </div>
    </div>
<div class = "tags-row">
    <?php
    foreach ($result2 as $record2){
        ?>
        <h1 class = "detail-tags">
            #<?php echo htmlspecialchars($record2['name']);?>
        </h1>
    <?php } ?>
</div>

</div>
