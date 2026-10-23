<%@ Page Title="Create Account | TEXTILES" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="registeraspx.aspx.cs" Inherits="SE_Project.registeraspx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<div class="register-page">

    <!-- ================= LEFT: GREEN BRAND PANEL ================= -->
    <aside class="register-brand-panel">

        <div class="brand-top">
            <a href="<%= ResolveUrl("~/index.aspx") %>" class="brand-logo">
                TEXTILES
            </a>
        </div>

        <div class="brand-middle">
            <h1>Join the<br />community of<br />fine weaves.</h1>
            <p>
                Create an account today to get early
                access to limited edition drops, organic
                fabrics, and custom sizing menus.
            </p>
        </div>

        <div class="brand-bottom">
            <div class="brand-photo">
                <img src="<%= ResolveUrl("~/Images/weaving.jpg") %>"
                     alt="Artisan weaving textile on a traditional loom" />
            </div>
        </div>

    </aside>

    <!-- ================= RIGHT: FORM PANEL ================= -->
    <section class="register-panel">

        <!-- Top bar -->
        <div class="register-topbar">
            <a href="<%= ResolveUrl("~/login.aspx") %>" class="back-link">
                <span class="back-arrow">&#8592;</span>
                <span>Back to Login</span>
            </a>

            <h2 class="topbar-title">Create Account</h2>
        </div>

        <!-- Form content -->
        <div class="register-content">

            <form class="register-form" onsubmit="return handleRegister(event);" autocomplete="off">

                <!-- Row 1: Full Name + Email -->
                <div class="form-row">
                    <div class="form-field">
                        <label for="txtFullName">Full Name</label>
                        <input type="text"
                               id="txtFullName"
                               name="fullName"
                               class="reg-input"
                               placeholder="Enter your name"
                               autocomplete="name"
                               required />
                    </div>

                    <div class="form-field">
                        <label for="txtEmail">Email</label>
                        <input type="email"
                               id="txtEmail"
                               name="email"
                               class="reg-input"
                               placeholder="Enter your email"
                               autocomplete="email"
                               required />
                    </div>
                </div>

                <!-- Row 2: Phone -->
                <div class="form-row">
                    <div class="form-field form-field-full">
                        <label for="txtPhone">Phone Number</label>
                        <input type="tel"
                               id="txtPhone"
                               name="phone"
                               class="reg-input"
                               placeholder="Enter your phone number"
                               autocomplete="tel"
                               required />
                    </div>
                </div>

                <!-- Row 3: Password + Confirm -->
                <div class="form-row">
                    <div class="form-field">
                        <label for="txtPassword">Password</label>
                        <div class="input-wrap">
                            <input type="password"
                                   id="txtPassword"
                                   name="password"
                                   class="reg-input has-toggle"
                                   placeholder="Enter password"
                                   autocomplete="new-password"
                                   required />

                            <button type="button"
                                    class="toggle-password"
                                    data-target="txtPassword"
                                    aria-label="Show password"
                                    aria-pressed="false">
                                <span class="eye-icon">&#128065;</span>
                            </button>
                        </div>
                    </div>

                    <div class="form-field">
                        <label for="txtConfirm">Confirm Password</label>
                        <div class="input-wrap">
                            <input type="password"
                                   id="txtConfirm"
                                   name="confirmPassword"
                                   class="reg-input has-toggle"
                                   placeholder="Confirm password"
                                   autocomplete="new-password"
                                   required />

                            <button type="button"
                                    class="toggle-password"
                                    data-target="txtConfirm"
                                    aria-label="Show password"
                                    aria-pressed="false">
                                <span class="eye-icon">&#128065;</span>
                            </button>
                        </div>
                    </div>
                </div>

                <!-- Submit -->
                <div class="submit-wrap">
                    <button type="submit" class="register-submit" id="btnRegister">
                        Create Account
                    </button>
                </div>

                <!-- Message -->
                <span class="register-message" id="lblMessage" aria-live="polite"></span>

            </form>

            <!-- Bottom link -->
            <div class="register-footer">
                Already have an account?
                <a href="<%= ResolveUrl("~/login.aspx") %>">Login</a>
            </div>

        </div>

    </section>

</div>

<style>
    /* ================= PAGE WRAPPER ================= */
    .register-page {
        --green: #08783c;
        --green-dark: #065a2c;
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
        grid-template-columns: 380px 1fr;
        min-height: 100vh;
        background: #ffffff;
        font-family: 'Segoe UI', Arial, sans-serif;
        color: var(--dark);
        overflow: hidden;
    }

    .register-page *,
    .register-page *::before,
    .register-page *::after {
        box-sizing: border-box;
    }

    /* ================= ANIMATIONS ================= */
    @keyframes rgFadeUp {
        from { opacity: 0; transform: translateY(22px); }
        to   { opacity: 1; transform: translateY(0); }
    }

    @keyframes rgFadeIn {
        from { opacity: 0; }
        to   { opacity: 1; }
    }

    @keyframes rgSlideRight {
        from { opacity: 0; transform: translateX(-22px); }
        to   { opacity: 1; transform: translateX(0); }
    }

    @keyframes rgFloat {
        0%, 100% { transform: translateY(0); }
        50%      { transform: translateY(-6px); }
    }

    @keyframes rgPulseDot {
        0%, 100% { opacity: 1; transform: scale(1); }
        50%      { opacity: .6; transform: scale(.85); }
    }

    /* ================= LEFT BRAND PANEL ================= */
    .register-brand-panel {
        position: relative;
        display: flex;
        flex-direction: column;
        padding: 42px 34px 34px;
        background: linear-gradient(165deg, #0a8a44 0%, #08783c 55%, #065a2c 100%);
        color: #ffffff;
        overflow: hidden;
        animation: rgFadeIn .6s var(--ease) both;
    }

    /* Decorative glow */
    .register-brand-panel::before {
        content: '';
        position: absolute;
        top: -20%;
        right: -30%;
        width: 340px;
        height: 340px;
        border-radius: 50%;
        background: radial-gradient(circle, rgba(255,255,255,.14), transparent 70%);
        animation: rgFloat 8s ease-in-out infinite;
        pointer-events: none;
    }

    .register-brand-panel::after {
        content: '';
        position: absolute;
        bottom: -15%;
        left: -20%;
        width: 280px;
        height: 280px;
        border-radius: 50%;
        background: radial-gradient(circle, rgba(201,162,39,.18), transparent 70%);
        animation: rgFloat 10s ease-in-out infinite reverse;
        pointer-events: none;
    }

    .brand-top {
        position: relative;
        z-index: 2;
        animation: rgSlideRight .7s .05s var(--ease) both;
    }

    .brand-logo {
        color: #ffffff;
        font-size: 24px;
        font-weight: 900;
        letter-spacing: 1.2px;
        text-decoration: none;
        position: relative;
        display: inline-block;
    }

    .brand-logo::after {
        content: '';
        position: absolute;
        left: 0;
        bottom: -6px;
        width: 40px;
        height: 2px;
        background: rgba(255,255,255,.75);
        border-radius: 2px;
    }

    .brand-middle {
        position: relative;
        z-index: 2;
        flex: 1;
        display: flex;
        flex-direction: column;
        justify-content: center;
        margin: 40px 0;
        animation: rgSlideRight .8s .15s var(--ease) both;
    }

    .brand-middle h1 {
        margin: 0 0 22px;
        font-size: clamp(26px, 2.4vw, 34px);
        font-weight: 900;
        line-height: 1.18;
        letter-spacing: -.3px;
        color: #ffffff;
    }

    .brand-middle p {
        margin: 0;
        color: rgba(255,255,255,.86);
        font-size: 13.5px;
        line-height: 1.85;
        max-width: 300px;
    }

    .brand-bottom {
        position: relative;
        z-index: 2;
        animation: rgFadeUp .9s .3s var(--ease) both;
    }

    .brand-photo {
        position: relative;
        width: 100%;
        aspect-ratio: 16 / 9;
        border-radius: 12px;
        overflow: hidden;
        background: #063f20;
        box-shadow: 0 14px 34px rgba(0,0,0,.28);
        transition: transform .45s var(--ease), box-shadow .45s var(--ease);
    }

    .brand-photo:hover {
        transform: translateY(-4px) scale(1.015);
        box-shadow: 0 20px 44px rgba(0,0,0,.38);
    }

    .brand-photo img {
        width: 100%;
        height: 100%;
        object-fit: cover;
        display: block;
        transition: transform .7s var(--ease);
    }

    .brand-photo:hover img {
        transform: scale(1.06);
    }

    .brand-photo::after {
        content: '';
        position: absolute;
        inset: 0;
        background: linear-gradient(180deg, transparent 55%, rgba(0,0,0,.35));
        pointer-events: none;
    }

    /* ================= RIGHT FORM PANEL ================= */
    .register-panel {
        display: flex;
        flex-direction: column;
        padding: 34px 6% 40px;
        background: #ffffff;
        animation: rgFadeIn .7s .1s var(--ease) both;
        overflow-y: auto;
    }

    /* Top bar */
    .register-topbar {
        display: flex;
        align-items: center;
        justify-content: space-between;
        gap: 16px;
        flex-wrap: wrap;
        margin-bottom: 60px;
        animation: rgFadeUp .6s .1s var(--ease) both;
    }

    .back-link {
        display: inline-flex;
        align-items: center;
        gap: 8px;
        color: var(--green);
        font-size: 13px;
        font-weight: 700;
        text-decoration: none;
        transition: transform .25s var(--ease);
    }

    .back-link:hover {
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

    .back-link:hover .back-arrow {
        background: var(--green);
        color: #fff;
    }

    .topbar-title {
        margin: 0;
        color: var(--green);
        font-size: 20px;
        font-weight: 900;
        letter-spacing: .3px;
    }

    /* Content */
    .register-content {
        flex: 1;
        display: flex;
        flex-direction: column;
        justify-content: center;
        max-width: 900px;
        width: 100%;
        margin: 0 auto;
    }

    /* Form */
    .register-form {
        display: block;
        animation: rgFadeUp .8s .2s var(--ease) both;
    }

    .form-row {
        display: grid;
        grid-template-columns: 1fr 1fr;
        gap: 22px;
        margin-bottom: 22px;
    }

    .form-field-full {
        grid-column: 1 / -1;
    }

    .form-field label {
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

    .reg-input {
        width: 100%;
        height: 50px;
        padding: 0 18px;
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

    .reg-input.has-toggle {
        padding-right: 48px;
    }

    .reg-input::placeholder {
        color: #9aa096;
    }

    .reg-input:hover {
        background: #eef2ea;
    }

    .reg-input:focus {
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

    /* Submit */
    .submit-wrap {
        display: flex;
        justify-content: flex-end;
        margin-top: 14px;
    }

    .register-submit {
        position: relative;
        min-width: 300px;
        height: 52px;
        padding: 0 34px;
        border: 0;
        border-radius: 9px;
        background: linear-gradient(135deg, var(--green), var(--green-light));
        color: #ffffff;
        font-size: 14px;
        font-weight: 800;
        letter-spacing: 1.2px;
        text-transform: uppercase;
        cursor: pointer;
        box-shadow: 0 8px 22px rgba(8, 120, 60, .32);
        overflow: hidden;
        transition: transform .25s var(--ease),
                    box-shadow .3s var(--ease),
                    letter-spacing .35s var(--ease);
    }

    .register-submit::before {
        content: '';
        position: absolute;
        top: 0;
        left: -100%;
        width: 100%;
        height: 100%;
        background: linear-gradient(90deg, transparent, rgba(255,255,255,.3), transparent);
        transition: left .6s var(--ease);
    }

    .register-submit:hover::before {
        left: 100%;
    }

    .register-submit:hover {
        transform: translateY(-2px);
        box-shadow: 0 14px 30px rgba(8, 120, 60, .42);
        letter-spacing: 1.8px;
    }

    .register-submit:active {
        transform: translateY(0);
    }

    .register-submit:disabled {
        opacity: .85;
        cursor: wait;
    }

    /* Message */
    .register-message {
        display: block;
        margin-top: 16px;
        font-size: 12.5px;
        font-weight: 600;
        color: #d93050;
        min-height: 16px;
        text-align: right;
        animation: rgFadeIn .3s var(--ease);
    }

    .register-message.success {
        color: var(--green);
    }

    /* Footer link */
    .register-footer {
        margin-top: 34px;
        color: var(--muted);
        font-size: 13px;
        text-align: right;
        animation: rgFadeUp .8s .3s var(--ease) both;
    }

    .register-footer a {
        margin-left: 5px;
        color: var(--green);
        font-weight: 800;
        text-decoration: none;
        position: relative;
    }

    .register-footer a::after {
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

    .register-footer a:hover::after {
        transform: scaleX(1);
    }

    /* ================= RESPONSIVE ================= */
    @media (max-width: 1080px) {
        .register-page {
            grid-template-columns: 320px 1fr;
        }

        .register-brand-panel {
            padding: 34px 26px 26px;
        }
    }

    @media (max-width: 860px) {
        .register-page {
            grid-template-columns: 1fr;
        }

        .register-brand-panel {
            padding: 28px 24px;
            min-height: auto;
        }

        .brand-middle {
            margin: 26px 0;
        }

        .brand-middle h1 {
            font-size: 26px;
        }

        .brand-bottom {
            max-width: 380px;
        }

        .register-panel {
            padding: 26px 6% 32px;
        }

        .register-topbar {
            margin-bottom: 34px;
        }

        .form-row {
            grid-template-columns: 1fr;
            gap: 18px;
            margin-bottom: 18px;
        }

        .submit-wrap {
            justify-content: stretch;
        }

        .register-submit {
            width: 100%;
            min-width: 0;
        }

        .register-message,
        .register-footer {
            text-align: center;
        }
    }

    @media (max-width: 520px) {
        .register-brand-panel {
            padding: 22px 18px;
        }

        .brand-logo {
            font-size: 20px;
        }

        .brand-middle h1 {
            font-size: 22px;
        }

        .brand-middle p {
            font-size: 12.5px;
        }

        .register-panel {
            padding: 20px 5% 28px;
        }

        .topbar-title {
            font-size: 17px;
        }

        .reg-input {
            height: 46px;
            font-size: 13px;
        }

        .register-submit {
            height: 48px;
            font-size: 13px;
            letter-spacing: 1px;
        }
    }

    @media (prefers-reduced-motion: reduce) {
        .register-page *,
        .register-page *::before,
        .register-page *::after {
            animation-duration: .01ms !important;
            animation-iteration-count: 1 !important;
            transition-duration: .01ms !important;
        }
    }
</style>

<script type="text/javascript">
    (function () {
        'use strict';

        /* ---- Password visibility toggles ---- */
        var toggles = document.querySelectorAll('.toggle-password');
        toggles.forEach(function (btn) {
            btn.addEventListener('click', function () {
                var targetId = btn.getAttribute('data-target');
                var input = document.getElementById(targetId);
                if (!input) return;

                var isHidden = input.type === 'password';
                input.type = isHidden ? 'text' : 'password';

                btn.setAttribute('aria-pressed', isHidden ? 'true' : 'false');
                btn.setAttribute('aria-label', isHidden ? 'Hide password' : 'Show password');

                var icon = btn.querySelector('.eye-icon');
                if (icon) icon.style.opacity = isHidden ? '1' : '.55';

                input.focus();
            });
        });

        /* ---- Auto-focus first field on desktop ---- */
        var first = document.getElementById('txtFullName');
        if (first && window.matchMedia('(min-width: 861px)').matches) {
            setTimeout(function () { first.focus(); }, 400);
        }
    })();

    /* ---- Static register handler (client-side only) ---- */
    function handleRegister(event) {
        event.preventDefault();

        var name = document.getElementById('txtFullName');
        var email = document.getElementById('txtEmail');
        var phone = document.getElementById('txtPhone');
        var pwd = document.getElementById('txtPassword');
        var confirm = document.getElementById('txtConfirm');
        var message = document.getElementById('lblMessage');
        var button = document.getElementById('btnRegister');

        var nameVal = (name.value || '').trim();
        var emailVal = (email.value || '').trim();
        var phoneVal = (phone.value || '').trim();
        var pwdVal = pwd.value || '';
        var confirmVal = confirm.value || '';

        /* Reset message */
        message.className = 'register-message';

        if (nameVal.length < 2) {
            message.textContent = 'Please enter your full name.';
            name.focus();
            return false;
        }

        if (!/^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(emailVal)) {
            message.textContent = 'Please enter a valid email address.';
            email.focus();
            return false;
        }

        if (!/^[0-9+\-\s()]{7,15}$/.test(phoneVal)) {
            message.textContent = 'Please enter a valid phone number.';
            phone.focus();
            return false;
        }

        if (pwdVal.length < 6) {
            message.textContent = 'Password must be at least 6 characters.';
            pwd.focus();
            return false;
        }

        if (pwdVal !== confirmVal) {
            message.textContent = 'Passwords do not match.';
            confirm.focus();
            return false;
        }

        /* Demo success state */
        message.textContent = 'Creating your account...';
        message.className = 'register-message success';

        if (button) {
            button.disabled = true;
            button.textContent = 'Creating...';
        }

        setTimeout(function () {
            message.textContent = 'Static demo — connect a backend to save your account.';
            message.className = 'register-message success';

            if (button) {
                button.disabled = false;
                button.textContent = 'Create Account';
            }
        }, 1200);

        return false;
    }
</script>

</asp:Content>