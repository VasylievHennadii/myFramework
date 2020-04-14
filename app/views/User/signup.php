<h2>Регистрация</h2>

<div class="row">
    <div class="col-md-6">
        <form method="post" action="/user/signup">
            <div class="form-group">
                <label for="login">Login</label>
                <input type="text" name="login" class="form-control" id="login" placeholder="Login" value="<?= isset($_SESSION['form_data']['login']) ? h($_SESSION['form_data']['login']) : '';?>">
            </div>
            <div class="form-group">
                <label for="password">Password</label>
                <input type="password" name="password" class="form-control" id="password" placeholder="Password">
            </div>
            <div class="form-group">
                <label for="name">Имя</label>
                <input type="text" name="name" class="form-control" id="name" placeholder="Имя" value="<?= isset($_SESSION['form_data']['name']) ? h($_SESSION['form_data']['name']) : '';?>">
            </div>
            <div class="form-group">
                <label for="email">Email</label>
                <input type="text" name="email" class="form-control" id="email" placeholder="Email" value="<?= isset($_SESSION['form_data']['email']) ? h($_SESSION['form_data']['email']) : '';?>">
            </div>
            <button type="submit" class="btn btn-default">Зарегистрировать</button>
        </form>
        <?php if(isset($_SESSION['form_data'])) unset($_SESSION['form_data']) ?>
    </div>
</div>