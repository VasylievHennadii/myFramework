<div class="container">
    <ul class="nav nav-pills">
    <?php foreach($menu as $item) : ?>
        <li><a href="category/<?= $item['id']?>"><?= $item['title']?></a></li>
    <?php endforeach; ?>
        <li role="presentation"><a href="#"></a></li>
        <li role="presentation"><a href="#"></a></li>
    </ul>
    <?php if(!empty($posts)): ?>
    <?php foreach($posts as $post): ?>
        <div class="panel panel-default">
            <div class="panel-heading"><b><?=$post['title'] . '/' . 'Дата: ' . $post['date']?></b></div>
            <div class="panel-body">
            <?=$post['content']?>
            </div>
        </div>
    <?php endforeach; ?>
    <?php endif; ?>
</div>
