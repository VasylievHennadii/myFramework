<?php if(!empty($posts)) : ?>
    <?php foreach($posts as $post) : ?>
        <div class="content-grid-info">
            <img src="/blog/images/post1.jpg" alt=""/>
            <div class="post-info">
                <h4><a href="<?=$post->id;?>"><?=$post->title;?></a> <?=$post->date;?></h4>
                <p><?=$post->short_content;?></p>
                <a href="<?=$post->id;?>"><span></span>READ MORE</a>
            </div>
        </div>
    <?php endforeach; ?>
    <div class="text-center">
        <p>Статей: <?=count($posts); ?> из <?=$total;?> </p>
        <?php if($pagination->countPages > 1) :?>
            <?=$pagination;?>
        <?php endif; ?>
    </div>
<?php else: ?>
    <h3>Posts not found...</h3>
<?php endif; ?>

