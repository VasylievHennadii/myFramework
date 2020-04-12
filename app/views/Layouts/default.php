<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">    
    <?php \fw\core\base\View::getMeta(); ?>
    <link  href="/public/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="/public/css/main.css" rel="stylesheet">
  </head>
  <body>

    <div class="container">
      <?php if(!empty($menu)) : ?>
      <ul class="nav nav-pills">
          <li><a href="/">Home</a></li>
          <li><a href="/page/about">About</a></li>
          <li><a href="/admin">Admin</a></li>
      <!-- <?php foreach($menu as $item) : ?>
          <li><a href="category/<?= $item['id']?>"><?= $item['title']?></a></li>
      <?php endforeach; ?>          -->
      </ul>
      <?php endif; ?>
      <h1>Hello, world!</h1>

    <?=$content?>

    <?php //debug(fw\core\Db::$countSql)?>
    <?php // debug(fw\core\Db::$queries)?>

    </div>
    
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <script src="/public/bootstrap/js/bootstrap.min.js"></script>    
    <?php 
        foreach($scripts as $script) {
          echo $script;
        }
    ?>
  </body>
</html>