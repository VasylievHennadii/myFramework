<div class="container">
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
