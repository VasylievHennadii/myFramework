<?php if(!empty($posts)) : ?>
    <?php foreach($posts as $post) : ?>
        <div class="content-grid-info">
            <img src="<?=$post->preview;?>" alt=""/>
            <div class="post-info">
                <h4><a href="<?=$post->id;?>"><?=$post->title;?></a> <?=$post->date;?></h4>
                <p><?=$post->short_content;?></p>
                <p><?=$post->content;?></p>
                <a href="<?=$post->id;?>"><span></span><?php __('read_more');?></a>
            </div>
        </div>
    <?php endforeach; ?>
    <div class="text-center">
        <p><?php __('articles');?>: <?=count($posts); ?> <?php __('for');?> <?=$total;?> </p>
        <?php if($pagination->countPages > 1) :?>
            <?=$pagination;?>
        <?php endif; ?>
    </div>
<?php else: ?>
    <h3>Posts not found...</h3>
<?php endif; ?>

