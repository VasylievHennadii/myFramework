<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">    
    <title>DEFAULT | <?=$title?></title>
    <link  href="/public/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="/public/css/main.css" rel="stylesheet">
  </head>
  <body>

    <div class="container">
      Здесь нет меню
      <h1>Hello, world!</h1>

    <?=$content?>

    <?php //debug(fw\core\Db::$countSql)?>
    <?php // debug(fw\core\Db::$queries)?>

    </div>
    
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <script src="/public/bootstrap/js/bootstrap.min.js"></script>
  </body>
</html>