<%@ Page Title="Login | TEXTILES" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="SE_Project.login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<div class="login-page">

    <!-- ================= LEFT: FORM PANEL ================= -->
    <div class="login-panel">

        <!-- Top bar -->
        <div class="login-topbar">
            <a href="<%= ResolveUrl("~/index.aspx") %>" class="login-back">
                <span class="back-arrow">&#8592;</span>
                <span>Back to Splash</span>
            </a>

            <a href="<%= ResolveUrl("~/index.aspx") %>" class="login-brand">
                TEXTILES
            </a>
        </div>

        <!-- Form content -->
        <div class="login-content">

            <header class="login-header">
                <h1>WELCOME BACK!</h1>
                <p>Login to access your custom textile catalog.</p>
            </header>

            <!-- Static login form -->
            <form class="login-form" onsubmit="return handleLogin(event);" autocomplete="off">

                <!-- Email -->
                <div class="login-field">
                    <label for="txtEmail">Email Address</label>
                    <div class="input-wrap">
                        <input type="email"
                               id="txtEmail"
                               name="email"
                               class="login-input"
                               placeholder="Enter your email"
                               autocomplete="email"
                               required />
                    </div>
                </div>

                <!-- Password -->
                <div class="login-field">
                    <label for="txtPassword">Password</label>
                    <div class="input-wrap">
                        <input type="password"
                               id="txtPassword"
                               name="password"
                               class="login-input"
                               placeholder="Enter your password"
                               autocomplete="current-password"
                               required />

                        <button type="button"
                                class="toggle-password"
                                id="togglePassword"
                                aria-label="Show password"
                                aria-pressed="false">
                            <span class="eye-icon">&#128065;</span>
                        </button>
                    </div>
                </div>

                <!-- Inline helpers -->
                <div class="login-helpers">
                    <a href="<%= ResolveUrl("~/forgot-password.aspx") %>"
                       class="helper-link helper-strong">
                        Forgot Password?
                    </a>

                    <a href="<%= ResolveUrl("~/admin/login.aspx") %>"
                       class="helper-link">
                        Admin Panel
                    </a>
                </div>

                <!-- Submit -->
                <button type="submit" class="login-submit" id="btnLogin">
                    Login
                </button>

                <!-- Message placeholder -->
                <span class="login-message" id="lblMessage" aria-live="polite"></span>

            </form>

            <!-- Bottom link -->
            <div class="login-footer">
                Don't have an account?
                <a href="<%= ResolveUrl("~/register.aspx") %>">Register</a>
            </div>

        </div>
    </div>

    <!-- ================= RIGHT: VISUAL PANEL ================= -->
    <div class="login-visual" role="presentation">
        <div class="visual-overlay"></div>

        <div class="visual-copy">
            <span class="visual-eyebrow">TEXTILES — SS/25</span>
            <h2>Timeless Essentials,<br />Tailored for You.</h2>
        </div>
    </div>

</div>

<style>
    /* ================= PAGE WRAPPER ================= */
    .login-page {
        --green: #08783c;
        --green-dark: #075c2e;
        --green-light: #0a9e4f;
        --gold: #c9a227;
        --cream: #fbf9f7;
        --dark: #1d1f1c;
        --muted: #7c8078;
        --border: #e5e7e2;
        --input-bg: #f3f6f1;
        --ease: cubic-bezier(.4, 0, .2, 1);
        --ease-bounce: cubic-bezier(.34, 1.56, .64, 1);

        display: grid;
        grid-template-columns: 1fr 1fr;
        min-height: 100vh;
        background: var(--cream);
        font-family: 'Segoe UI', Arial, sans-serif;
        color: var(--dark);
        overflow: hidden;
    }

    .login-page *,
    .login-page *::before,
    .login-page *::after {
        box-sizing: border-box;
    }

    /* ================= ANIMATIONS ================= */
    @keyframes lgFadeUp {
        from { opacity: 0; transform: translateY(22px); }
        to   { opacity: 1; transform: translateY(0); }
    }

    @keyframes lgFadeIn {
        from { opacity: 0; }
        to   { opacity: 1; }
    }

    @keyframes lgFloat {
        0%, 100% { transform: translateY(0); }
        50%      { transform: translateY(-8px); }
    }

    /* ================= LEFT PANEL ================= */
    .login-panel {
        position: relative;
        display: flex;
        flex-direction: column;
        padding: 32px 8%;
        background: #ffffff;
        animation: lgFadeIn .6s var(--ease) both;
    }

    /* Top bar */
    .login-topbar {
        display: flex;
        align-items: center;
        justify-content: space-between;
        gap: 12px;
        margin-bottom: 60px;
        animation: lgFadeUp .6s .05s var(--ease) both;
    }

    .login-back {
        display: inline-flex;
        align-items: center;
        gap: 8px;
        color: var(--green);
        font-size: 13px;
        font-weight: 700;
        text-decoration: none;
        transition: transform .25s var(--ease);
    }

    .login-back:hover {
        transform: translateX(-3px);
    }

    .back-arrow {
        display: inline-grid;
        place-items: center;
        width: 22px;
        height: 22px;
        border-radius: 50%;
        background: rgba(8, 120, 60, .1);
        color: var(--green);
        font-size: 13px;
        transition: background .25s var(--ease), color .25s var(--ease);
    }

    .login-back:hover .back-arrow {
        background: var(--green);
        color: #fff;
    }

    .login-brand {
        color: var(--green);
        font-size: 18px;
        font-weight: 800;
        letter-spacing: 1.5px;
        text-decoration: none;
        position: relative;
    }

    .login-brand::after {
        content: '';
        position: absolute;
        left: 0;
        right: 0;
        bottom: -4px;
        height: 2px;
        background: var(--green);
        transform: scaleX(0);
        transform-origin: left;
        transition: transform .35s var(--ease);
    }

    .login-brand:hover::after {
        transform: scaleX(1);
    }

    /* Content wrapper */
    .login-content {
        flex: 1;
        display: flex;
        flex-direction: column;
        justify-content: center;
        max-width: 460px;
        width: 100%;
        margin: 0 auto;
        padding-bottom: 30px;
    }

    /* Header */
    .login-header {
        margin-bottom: 36px;
        animation: lgFadeUp .7s .1s var(--ease) both;
    }

    .login-header h1 {
        margin: 0 0 12px;
        color: var(--dark);
        font-size: clamp(28px, 3vw, 38px);
        font-weight: 900;
        letter-spacing: -.5px;
        line-height: 1.1;
    }

    .login-header h1::after {
        content: '';
        display: block;
        width: 46px;
        height: 3px;
        margin-top: 14px;
        border-radius: 3px;
        background: linear-gradient(90deg, var(--green), var(--gold));
    }

    .login-header p {
        margin: 0;
        color: var(--muted);
        font-size: 13.5px;
        line-height: 1.7;
    }

    /* Form */
    .login-form {
        display: block;
        animation: lgFadeUp .7s .18s var(--ease) both;
    }

    .login-field {
        margin-bottom: 22px;
    }

    .login-field label {
        display: block;
        margin-bottom: 9px;
        color: var(--dark);
        font-size: 12.5px;
        font-weight: 800;
        letter-spacing: .3px;
    }

    .input-wrap {
        position: relative;
    }

    .login-input {
        width: 100%;
        height: 52px;
        padding: 0 48px 0 18px;
        border: 1.5px solid var(--border);
        border-radius: 9px;
        background: var(--input-bg);
        color: var(--dark);
        font-size: 13.5px;
        outline: none;
        transition: border-color .25s var(--ease),
                    background .25s var(--ease),
                    box-shadow .25s var(--ease),
                    transform .25s var(--ease);
    }

    .login-input::placeholder {
        color: #9aa096;
    }

    .login-input:hover {
        background: #eef2ea;
    }

    .login-input:focus {
        border-color: var(--green);
        background: #ffffff;
        box-shadow: 0 0 0 4px rgba(8, 120, 60, .12);
        transform: translateY(-1px);
    }

    /* Password toggle */
    .toggle-password {
        position: absolute;
        top: 50%;
        right: 12px;
        transform: translateY(-50%);
        display: grid;
        place-items: center;
        width: 34px;
        height: 34px;
        border: 0;
        border-radius: 7px;
        background: transparent;
        color: #7c8078;
        cursor: pointer;
        transition: background .25s var(--ease),
                    color .25s var(--ease),
                    transform .25s var(--ease-bounce);
    }

    .toggle-password:hover {
        background: rgba(8, 120, 60, .08);
        color: var(--green);
    }

    .toggle-password:active {
        transform: translateY(-50%) scale(.92);
    }

    .eye-icon {
        font-size: 15px;
        line-height: 1;
    }

    /* Helpers */
    .login-helpers {
        display: flex;
        align-items: center;
        justify-content: space-between;
        gap: 10px;
        margin: 4px 0 30px;
        flex-wrap: wrap;
    }

    .helper-link {
        color: var(--muted);
        font-size: 12.5px;
        font-weight: 700;
        text-decoration: none;
        transition: color .25s var(--ease), transform .25s var(--ease);
    }

    .helper-link:hover {
        color: var(--green);
        transform: translateY(-1px);
    }

    .helper-strong {
        color: var(--green);
    }

    /* Submit */
    .login-submit {
        width: 100%;
        height: 54px;
        border: 0;
        border-radius: 9px;
        background: linear-gradient(135deg, var(--green), var(--green-light));
        color: #fff;
        font-size: 14px;
        font-weight: 800;
        letter-spacing: 1.2px;
        text-transform: uppercase;
        cursor: pointer;
        box-shadow: 0 8px 20px rgba(8, 120, 60, .32);
        transition: transform .25s var(--ease),
                    box-shadow .3s var(--ease),
                    background .3s var(--ease),
                    letter-spacing .35s var(--ease);
        position: relative;
        overflow: hidden;
    }

    .login-submit::before {
        content: '';
        position: absolute;
        top: 0;
        left: -100%;
        width: 100%;
        height: 100%;
        background: linear-gradient(90deg, transparent, rgba(255,255,255,.28), transparent);
        transition: left .6s var(--ease);
    }

    .login-submit:hover::before {
        left: 100%;
    }

    .login-submit:hover {
        transform: translateY(-2px);
        box-shadow: 0 14px 28px rgba(8, 120, 60, .42);
        letter-spacing: 1.8px;
    }

    .login-submit:active {
        transform: translateY(0);
    }

    .login-submit:disabled {
        opacity: .85;
        cursor: wait;
    }

    /* Message */
    .login-message {
        display: block;
        margin-top: 16px;
        font-size: 12.5px;
        font-weight: 600;
        color: #d93050;
        min-height: 16px;
        animation: lgFadeIn .3s var(--ease);
    }

    .login-message.success {
        color: var(--green);
    }

    /* Footer link */
    .login-footer {
        margin-top: 28px;
        padding-top: 22px;
        border-top: 1px dashed var(--border);
        color: var(--muted);
        font-size: 13px;
        text-align: center;
        animation: lgFadeUp .7s .26s var(--ease) both;
    }

    .login-footer a {
        margin-left: 5px;
        color: var(--green);
        font-weight: 800;
        text-decoration: none;
        position: relative;
    }

    .login-footer a::after {
        content: '';
        position: absolute;
        left: 0;
        right: 0;
        bottom: -2px;
        height: 1.5px;
        background: var(--green);
        transform: scaleX(0);
        transform-origin: left;
        transition: transform .3s var(--ease);
    }

    .login-footer a:hover::after {
        transform: scaleX(1);
    }

    /* ================= RIGHT VISUAL ================= */
    .login-visual {
        position: relative;
        background-image: url('<%= ResolveUrl("~/Images/login-hero.jpg") %>');
        background-size: cover;
        background-position: center;
        background-repeat: no-repeat;
        animation: lgFadeIn .8s var(--ease) both;
        overflow: hidden;
    }

    .login-visual::before {
        content: '';
        position: absolute;
        inset: 0;
        background:
            linear-gradient(135deg, rgba(8,120,60,.08), rgba(0,0,0,.06)),
            #e8e2da;
        z-index: 0;
    }

    .visual-overlay {
        position: absolute;
        inset: 0;
        background:
            radial-gradient(600px 400px at 30% 90%, rgba(0,0,0,.35), transparent 70%),
            linear-gradient(180deg, rgba(0,0,0,.05) 0%, rgba(0,0,0,.35) 100%);
        z-index: 1;
        pointer-events: none;
    }

    .login-visual::after {
        content: '';
        position: absolute;
        bottom: 6%;
        right: 6%;
        width: 160px;
        height: 160px;
        border-radius: 50%;
        background: radial-gradient(circle, rgba(8,120,60,.22), transparent 65%);
        animation: lgFloat 7s ease-in-out infinite;
        z-index: 2;
        pointer-events: none;
    }

    .visual-copy {
        position: absolute;
        left: 8%;
        bottom: 8%;
        max-width: 420px;
        z-index: 3;
        color: #fff;
        animation: lgFadeUp .9s .35s var(--ease) both;
    }

    .visual-eyebrow {
        display: inline-block;
        margin-bottom: 14px;
        padding: 6px 12px;
        border-radius: 4px;
        background: rgba(255,255,255,.15);
        border: 1px solid rgba(255,255,255,.28);
        color: #fff;
        font-size: 10.5px;
        font-weight: 800;
        letter-spacing: 2px;
        backdrop-filter: blur(6px);
    }

    .visual-copy h2 {
        margin: 0;
        color: #fff;
        font-size: clamp(22px, 2.6vw, 32px);
        font-weight: 800;
        line-height: 1.25;
        text-shadow: 0 3px 18px rgba(0,0,0,.45);
    }

    /* ================= RESPONSIVE ================= */
    @media (max-width: 960px) {
        .login-page {
            grid-template-columns: 1fr;
        }

        .login-visual {
            display: none;
        }

        .login-panel {
            padding: 26px 7%;
            min-height: 100vh;
        }

        .login-topbar {
            margin-bottom: 40px;
        }
    }

    @media (max-width: 520px) {
        .login-panel {
            padding: 20px 6% 30px;
        }

        .login-topbar {
            margin-bottom: 32px;
        }

        .login-header {
            margin-bottom: 28px;
        }

        .login-input {
            height: 48px;
            font-size: 13px;
        }

        .login-submit {
            height: 50px;
            font-size: 13px;
        }

        .login-helpers {
            margin: 4px 0 24px;
        }
    }

    @media (prefers-reduced-motion: reduce) {
        .login-page *,
        .login-page *::before,
        .login-page *::after {
            animation-duration: .01ms !important;
            animation-iteration-count: 1 !important;
            transition-duration: .01ms !important;
        }
    }
</style>

<script type="text/javascript">
    (function () {
        'use strict';

        /* ---- Password visibility toggle ---- */
        var toggle = document.getElementById('togglePassword');
        var pwd = document.getElementById('txtPassword');

        if (toggle && pwd) {
            toggle.addEventListener('click', function () {
                var isHidden = pwd.type === 'password';
                pwd.type = isHidden ? 'text' : 'password';

                toggle.setAttribute('aria-pressed', isHidden ? 'true' : 'false');
                toggle.setAttribute('aria-label', isHidden ? 'Hide password' : 'Show password');

                var icon = toggle.querySelector('.eye-icon');
                if (icon) {
                    icon.style.opacity = isHidden ? '1' : '.55';
                }

                pwd.focus();
            });
        }

        /* ---- Auto focus email on desktop ---- */
        var email = document.getElementById('txtEmail');
        if (email && window.matchMedia('(min-width: 960px)').matches) {
            setTimeout(function () { email.focus(); }, 400);
        }
    })();

    /* ---- Static login handler (no server-side) ---- */
    function handleLogin(event) {
        event.preventDefault();

        var email = document.getElementById('txtEmail');
        var password = document.getElementById('txtPassword');
        var message = document.getElementById('lblMessage');
        var button = document.getElementById('btnLogin');

        var emailVal = (email && email.value || '').trim();
        var pwdVal = (password && password.value || '');

        /* Simple client-side validation */
        var emailValid = /^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(emailVal);

        if (!emailValid) {
            message.textContent = 'Please enter a valid email address.';
            message.className = 'login-message';
            email.focus();
            return false;
        }

        if (pwdVal.length < 6) {
            message.textContent = 'Password must be at least 6 characters.';
            message.className = 'login-message';
            password.focus();
            return false;
        }

        /* Demo state */
        message.textContent = 'Signing you in...';
        message.className = 'login-message success';

        if (button) {
            button.disabled = true;
            button.textContent = 'Signing in...';
        }

        /* Simulate redirect after a short delay (demo only) */
        setTimeout(function () {
            message.textContent = 'Static demo — connect a backend to enable real login.';
            message.className = 'login-message success';

            if (button) {
                button.disabled = false;
                button.textContent = 'Login';
            }
        }, 1200);

        return false;
    }
</script>

</asp:Content>