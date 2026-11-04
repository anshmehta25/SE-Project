<%@ Page Title="TEXTILES | Checkout"
    Language="C#"
    MasterPageFile="~/Site.Master"
    AutoEventWireup="true"
    CodeBehind="checkout.aspx.cs"
    Inherits="SE_Project.checkout" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <script src="https://checkout.razorpay.com/v1/checkout.js"></script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<style>
    .checkout-page {
        --green: #08783c;
        --green-dark: #075c2e;
        --cream: #fbf9f7;
        --dark: #20251f;
        --muted: #77766f;
        --border: #e9e5e1;
        background: var(--cream);
        color: var(--dark);
        font: 14px Arial, sans-serif;
        padding: 24px 5%;
        min-height: 85vh;
    }

    .checkout-page *,
    .checkout-page *::before,
    .checkout-page *::after {
        box-sizing: border-box;
    }

    .checkout-page a {
        color: inherit;
        text-decoration: none;
    }

    .checkout-page img {
        display: block;
        max-width: 100%;
    }

    .ck-container {
        width: 100%;
        max-width: 1400px;
        margin: 0 auto;
    }

    /* BREADCRUMB */
    .ck-breadcrumb {
        display: flex;
        align-items: center;
        gap: 8px;
        margin-bottom: 20px;
        color: var(--muted);
        font-size: 12px;
    }

    .ck-breadcrumb a:hover {
        color: var(--green);
    }

    .ck-breadcrumb span {
        color: var(--dark);
        font-weight: 700;
    }

    /* HEADER */
    .ck-header {
        display: flex;
        align-items: end;
        justify-content: space-between;
        gap: 20px;
        margin-bottom: 22px;
        flex-wrap: wrap;
    }

    .ck-header h1 {
        margin: 0 0 7px;
        font-size: 28px;
    }

    .ck-header p {
        margin: 0;
        color: var(--muted);
        font-size: 13px;
        line-height: 1.7;
    }

    /* STEPS */
    .ck-steps {
        display: flex;
        align-items: center;
        gap: 8px;
        margin-bottom: 24px;
        padding: 14px 16px;
        border: 1px solid var(--border);
        border-radius: 10px;
        background: white;
        flex-wrap: wrap;
    }

    .ck-step {
        display: inline-flex;
        align-items: center;
        gap: 8px;
        color: var(--muted);
        font-size: 12px;
        font-weight: 600;
    }

    .ck-step-num {
        display: grid;
        place-items: center;
        width: 24px;
        height: 24px;
        border-radius: 50%;
        background: #e9e5e1;
        color: #77766f;
        font-size: 11px;
        font-weight: 700;
    }

    .ck-step.active .ck-step-num {
        background: var(--green);
        color: white;
    }

    .ck-step.active {
        color: var(--dark);
    }

    .ck-step.done .ck-step-num {
        background: #eaf3e8;
        color: var(--green);
    }

    .ck-step-divider {
        flex: 1;
        min-width: 20px;
        height: 1px;
        background: var(--border);
    }

    /* LAYOUT */
    .ck-layout {
        display: grid;
        grid-template-columns: 1.6fr 1fr;
        gap: 22px;
        align-items: start;
    }

    /* PANELS */
    .ck-panel {
        padding: 22px;
        border: 1px solid var(--border);
        border-radius: 12px;
        background: white;
        margin-bottom: 16px;
    }

    .ck-panel:last-child {
        margin-bottom: 0;
    }

    .ck-panel-head {
        display: flex;
        align-items: center;
        justify-content: space-between;
        gap: 12px;
        margin-bottom: 16px;
        flex-wrap: wrap;
    }

    .ck-panel h2 {
        margin: 0;
        font-size: 17px;
    }

    .ck-panel-sub {
        margin: 4px 0 0;
        color: var(--muted);
        font-size: 12px;
        line-height: 1.6;
    }

    .ck-link {
        color: var(--green) !important;
        font-size: 12px;
        font-weight: 700;
        text-decoration: underline;
        cursor: pointer;
    }

    /* FORM */
    .ck-form {
        display: flex;
        flex-direction: column;
        gap: 14px;
    }

    .ck-row {
        display: grid;
        grid-template-columns: 1fr 1fr;
        gap: 14px;
    }

    .ck-row.full {
        grid-template-columns: 1fr;
    }

    .ck-field {
        display: flex;
        flex-direction: column;
        gap: 6px;
        min-width: 0;
    }

    .ck-field label {
        color: #4b4f48;
        font-size: 12px;
        font-weight: 700;
        letter-spacing: .3px;
    }

    .ck-field label .req {
        color: #d93050;
        margin-left: 2px;
    }

    .ck-input {
        width: 100%;
        height: 44px;
        padding: 0 13px;
        border: 1px solid #d5ddd3;
        border-radius: 8px;
        outline: none;
        font-size: 13px;
        background: white;
        transition: border-color .15s, box-shadow .15s;
    }

    .ck-input:focus {
        border-color: var(--green);
        box-shadow: 0 0 0 3px rgba(8, 120, 60, .1);
    }

    .ck-input.invalid {
        border-color: #d93050;
    }

    .ck-input.invalid:focus {
        box-shadow: 0 0 0 3px rgba(217, 48, 80, .1);
    }

    .ck-error {
        display: block;
        min-height: 14px;
        color: #d93050;
        font-size: 11px;
        font-weight: 600;
    }

    /* ADDRESS / DELIVERY / PAYMENT OPTIONS */
    .ck-options {
        display: flex;
        flex-direction: column;
        gap: 10px;
    }

    .ck-option {
        position: relative;
        display: flex;
        align-items: flex-start;
        gap: 12px;
        padding: 14px;
        border: 1px solid var(--border);
        border-radius: 10px;
        background: white;
        cursor: pointer;
        transition: .15s;
    }

    .ck-option:hover {
        border-color: #c3d9c6;
        background: #fcfefb;
    }

    .ck-option.selected {
        border-color: var(--green);
        background: #f6fbf6;
        box-shadow: 0 0 0 1px var(--green) inset;
    }

    .ck-option input[type="radio"] {
        position: absolute;
        opacity: 0;
        pointer-events: none;
    }

    .ck-option-dot {
        flex-shrink: 0;
        width: 18px;
        height: 18px;
        margin-top: 1px;
        border: 2px solid #c3c9c0;
        border-radius: 50%;
        background: white;
        display: grid;
        place-items: center;
        transition: .15s;
    }

    .ck-option-dot::after {
        content: "";
        width: 8px;
        height: 8px;
        border-radius: 50%;
        background: transparent;
        transition: .15s;
    }

    .ck-option.selected .ck-option-dot {
        border-color: var(--green);
    }

    .ck-option.selected .ck-option-dot::after {
        background: var(--green);
    }

    .ck-option-body {
        flex: 1;
        min-width: 0;
    }

    .ck-option-title {
        display: flex;
        align-items: center;
        justify-content: space-between;
        gap: 10px;
        font-size: 13px;
        font-weight: 700;
        color: var(--dark);
    }

    .ck-option-title .price {
        color: var(--green);
        font-weight: 700;
    }

    .ck-option-title .price.free {
        color: var(--green);
    }

    .ck-option-desc {
        margin-top: 4px;
        color: var(--muted);
        font-size: 12px;
        line-height: 1.6;
    }

    .ck-option-tag {
        display: inline-block;
        margin-left: 6px;
        padding: 2px 7px;
        border-radius: 4px;
        background: #eaf3e8;
        color: var(--green);
        font-size: 10px;
        font-weight: 700;
        letter-spacing: .3px;
        text-transform: uppercase;
    }

    /* PAYMENT EXTRA FIELDS */
    .ck-card-fields {
        display: none;
        margin-top: 12px;
        padding: 14px;
        border: 1px dashed var(--border);
        border-radius: 8px;
        background: #fcfbf9;
    }

    .ck-card-fields.visible {
        display: block;
    }

    /* ORDER SUMMARY */
    .ck-summary {
        position: sticky;
        top: 20px;
        padding: 22px;
        border: 1px solid var(--border);
        border-radius: 12px;
        background: white;
    }

    .ck-summary h2 {
        margin: 0 0 16px;
        font-size: 18px;
    }

    .ck-summary-items {
        display: flex;
        flex-direction: column;
        gap: 12px;
        max-height: 320px;
        overflow-y: auto;
        padding-right: 6px;
        margin-bottom: 16px;
    }

    .ck-summary-item {
        display: grid;
        grid-template-columns: 56px 1fr auto;
        gap: 10px;
        align-items: center;
        padding: 8px 0;
        border-bottom: 1px dashed var(--border);
    }

    .ck-summary-item:last-child {
        border-bottom: 0;
    }

    .ck-summary-img {
        width: 56px;
        height: 68px;
        overflow: hidden;
        border-radius: 6px;
        background: #f1eeea;
    }

    .ck-summary-img img {
        width: 100%;
        height: 100%;
        object-fit: cover;
    }

    .ck-summary-body {
        min-width: 0;
    }

    .ck-summary-name {
        font-size: 12px;
        font-weight: 700;
        color: var(--dark);
        white-space: nowrap;
        overflow: hidden;
        text-overflow: ellipsis;
    }

    .ck-summary-meta {
        margin-top: 3px;
        color: var(--muted);
        font-size: 11px;
    }

    .ck-summary-price {
        color: var(--green);
        font-size: 12px;
        font-weight: 700;
        white-space: nowrap;
    }

    /* SUMMARY TOTALS */
    .ck-summary-row {
        display: flex;
        align-items: center;
        justify-content: space-between;
        gap: 10px;
        padding: 8px 0;
        font-size: 13px;
    }

    .ck-summary-row span:first-child {
        color: var(--muted);
    }

    .ck-summary-row.discount span:last-child {
        color: #d93050;
        font-weight: 700;
    }

    .ck-summary-row.total {
        margin-top: 8px;
        padding-top: 14px;
        border-top: 1px solid var(--border);
        font-size: 16px;
        font-weight: 700;
    }

    .ck-summary-row.total span:last-child {
        color: var(--green);
    }

    /* CHECKOUT BUTTON */
    .ck-place-order {
        margin-top: 18px;
        display: flex;
        flex-direction: column;
        gap: 10px;
    }

    .ck-btn {
        display: inline-flex;
        align-items: center;
        justify-content: center;
        gap: 8px;
        width: 100%;
        height: 46px;
        padding: 0 20px;
        border: 0;
        border-radius: 8px;
        background: var(--green);
        color: white !important;
        font-size: 13px;
        font-weight: 700;
        cursor: pointer;
        transition: .2s;
    }

    .ck-btn:hover {
        background: var(--green-dark);
        transform: translateY(-1px);
    }

    .ck-btn:disabled {
        background: #e6e3df;
        color: #8a8a84 !important;
        cursor: not-allowed;
        transform: none;
    }

    .ck-btn-ghost {
        display: inline-flex;
        align-items: center;
        justify-content: center;
        gap: 8px;
        width: 100%;
        height: 46px;
        padding: 0 20px;
        border: 1px solid var(--border);
        border-radius: 8px;
        background: white;
        color: #4b4f48 !important;
        font-size: 13px;
        font-weight: 700;
        cursor: pointer;
        transition: .2s;
    }

    .ck-btn-ghost:hover {
        border-color: var(--green);
        color: var(--green) !important;
    }

    .ck-note {
        margin-top: 14px;
        padding-top: 14px;
        border-top: 1px dashed var(--border);
        color: var(--muted);
        font-size: 11px;
        line-height: 1.8;
    }

    .ck-note strong {
        color: var(--dark);
    }

    .ck-secure {
        display: inline-flex;
        align-items: center;
        gap: 6px;
        margin-top: 10px;
        color: var(--muted);
        font-size: 11px;
    }

    .ck-secure::before {
        content: "\1F512";
        font-size: 12px;
    }

    /* RESPONSIVE */
    @media (max-width: 1000px) {
        .ck-layout {
            grid-template-columns: 1fr;
        }

        .ck-summary {
            position: static;
        }
    }

    @media (max-width: 700px) {
        .checkout-page {
            padding: 16px 4%;
        }

        .ck-header h1 {
            font-size: 23px;
        }

        .ck-row {
            grid-template-columns: 1fr;
        }

        .ck-steps {
            gap: 6px;
        }

        .ck-step span:last-child {
            display: none;
        }
    }

    @media (max-width: 480px) {
        .ck-header h1 {
            font-size: 21px;
        }

        .ck-panel {
            padding: 16px;
        }

        .ck-summary {
            padding: 16px;
        }
    }
</style>

<div class="checkout-page">
    <div class="ck-container">

        <!-- BREADCRUMB -->
        <nav class="ck-breadcrumb" aria-label="Breadcrumb">
            <a href="index.aspx">Home</a>
            <span>/</span>
            <a href="cart.aspx">Cart</a>
            <span>/</span>
            <span>Checkout</span>
        </nav>

        <!-- HEADER -->
        <div class="ck-header">
            <div>
                <h1>Checkout</h1>
                <p>Complete your details below to place your order.</p>
            </div>
        </div>

        <!-- STEPS -->
        <div class="ck-steps" aria-label="Checkout progress">
            <div class="ck-step done">
                <span class="ck-step-num">&#10003;</span>
                <span>Cart</span>
            </div>
            <div class="ck-step-divider"></div>
            <div class="ck-step active">
                <span class="ck-step-num">2</span>
                <span>Checkout</span>
            </div>
            <div class="ck-step-divider"></div>
            <div class="ck-step">
                <span class="ck-step-num">3</span>
                <span>Confirmation</span>
            </div>
        </div>

        <!-- MAIN LAYOUT -->
        <div class="ck-layout">

            <!-- LEFT: FORMS -->
            <div>

                <!-- CONTACT -->
                <section class="ck-panel">
                    <div class="ck-panel-head">
                        <div>
                            <h2>Contact Information</h2>
                            <p class="ck-panel-sub">We'll use this to send order updates.</p>
                        </div>
                        <a href="login.aspx" class="ck-link">Already have an account?</a>
                    </div>

                    <form class="ck-form" id="ckContactForm" novalidate>
                        <div class="ck-row">
                            <div class="ck-field">
                                <label for="ckEmail">Email Address <span class="req">*</span></label>
                                <input type="email" id="ckEmail" class="ck-input" value="<%: PreFillEmail %>" placeholder="you@example.com" autocomplete="email" />
                                <span class="ck-error" id="ckEmailError"></span>
                            </div>
                            <div class="ck-field">
                                <label for="ckPhone">Phone Number <span class="req">*</span></label>
                                <input type="tel" id="ckPhone" class="ck-input" value="<%: PreFillPhone %>" placeholder="10-digit mobile number" autocomplete="tel" />
                                <span class="ck-error" id="ckPhoneError"></span>
                            </div>
                        </div>
                    </form>
                </section>

                <!-- SHIPPING ADDRESS -->
                <section class="ck-panel">
                    <div class="ck-panel-head">
                        <div>
                            <h2>Shipping Address</h2>
                            <p class="ck-panel-sub">Where should we deliver your order?</p>
                        </div>
                    </div>

                    <form class="ck-form" id="ckAddressForm" novalidate>
                        <div class="ck-row">
                            <div class="ck-field">
                                <label for="ckFirstName">First Name <span class="req">*</span></label>
                                <input type="text" id="ckFirstName" class="ck-input" value="<%: PreFillFirstName %>" placeholder="First name" autocomplete="given-name" />
                                <span class="ck-error" id="ckFirstNameError"></span>
                            </div>
                            <div class="ck-field">
                                <label for="ckLastName">Last Name <span class="req">*</span></label>
                                <input type="text" id="ckLastName" class="ck-input" value="<%: PreFillLastName %>" placeholder="Last name" autocomplete="family-name" />
                                <span class="ck-error" id="ckLastNameError"></span>
                            </div>
                        </div>

                        <div class="ck-row full">
                            <div class="ck-field">
                                <label for="ckAddress1">Address Line 1 <span class="req">*</span></label>
                                <input type="text" id="ckAddress1" class="ck-input" placeholder="House / flat / building" autocomplete="address-line1" />
                                <span class="ck-error" id="ckAddress1Error"></span>
                            </div>
                        </div>

                        <div class="ck-row full">
                            <div class="ck-field">
                                <label for="ckAddress2">Address Line 2 (optional)</label>
                                <input type="text" id="ckAddress2" class="ck-input" placeholder="Street / area / landmark" autocomplete="address-line2" />
                            </div>
                        </div>

                        <div class="ck-row">
                            <div class="ck-field">
                                <label for="ckCity">City <span class="req">*</span></label>
                                <input type="text" id="ckCity" class="ck-input" placeholder="City" autocomplete="address-level2" />
                                <span class="ck-error" id="ckCityError"></span>
                            </div>
                            <div class="ck-field">
                                <label for="ckState">State <span class="req">*</span></label>
                                <input type="text" id="ckState" class="ck-input" placeholder="State" autocomplete="address-level1" />
                                <span class="ck-error" id="ckStateError"></span>
                            </div>
                        </div>

                        <div class="ck-row">
                            <div class="ck-field">
                                <label for="ckPincode">PIN Code <span class="req">*</span></label>
                                <input type="text" id="ckPincode" class="ck-input" placeholder="6-digit PIN" inputmode="numeric" maxlength="6" autocomplete="postal-code" />
                                <span class="ck-error" id="ckPincodeError"></span>
                            </div>
                            <div class="ck-field">
                                <label for="ckCountry">Country</label>
                                <input type="text" id="ckCountry" class="ck-input" value="India" autocomplete="country-name" readonly />
                            </div>
                        </div>
                    </form>
                </section>

                <!-- DELIVERY METHOD -->
                <section class="ck-panel">
                    <div class="ck-panel-head">
                        <div>
                            <h2>Delivery Method</h2>
                            <p class="ck-panel-sub">Choose how you'd like to receive your order.</p>
                        </div>
                    </div>

                    <div class="ck-options" id="ckDeliveryOptions">
                        <label class="ck-option selected" data-method="standard" data-price="0">
                            <input type="radio" name="delivery" value="standard" checked />
                            <span class="ck-option-dot"></span>
                            <div class="ck-option-body">
                                <div class="ck-option-title">
                                    <span>Standard Delivery <span class="ck-option-tag">Free</span></span>
                                    <span class="price free">Free</span>
                                </div>
                                <div class="ck-option-desc">3–5 business days</div>
                            </div>
                        </label>

                        <label class="ck-option" data-method="express" data-price="99">
                            <input type="radio" name="delivery" value="express" />
                            <span class="ck-option-dot"></span>
                            <div class="ck-option-body">
                                <div class="ck-option-title">
                                    <span>Express Delivery</span>
                                    <span class="price">&#8377; 99</span>
                                </div>
                                <div class="ck-option-desc">1–2 business days</div>
                            </div>
                        </label>

                        <label class="ck-option" data-method="sameday" data-price="199">
                            <input type="radio" name="delivery" value="sameday" />
                            <span class="ck-option-dot"></span>
                            <div class="ck-option-body">
                                <div class="ck-option-title">
                                    <span>Same-Day Delivery</span>
                                    <span class="price">&#8377; 199</span>
                                </div>
                                <div class="ck-option-desc">Delivered today (orders placed before 12 PM)</div>
                            </div>
                        </label>
                    </div>
                </section>

                <!-- PAYMENT METHOD -->
                <section class="ck-panel">
                    <div class="ck-panel-head">
                        <div>
                            <h2>Payment Method</h2>
                            <p class="ck-panel-sub">All transactions are secure and encrypted.</p>
                        </div>
                    </div>

                    <div class="ck-options" id="ckPaymentOptions">
                        <label class="ck-option selected" data-method="razorpay">
                            <input type="radio" name="payment" value="razorpay" checked />
                            <span class="ck-option-dot"></span>
                            <div class="ck-option-body">
                                <div class="ck-option-title">
                                    <span>Razorpay Secure Online Payment</span>
                                    <span class="ck-option-tag" style="background:var(--green); color:white;">Recommended</span>
                                </div>
                                <div class="ck-option-desc">Cards (Visa, Mastercard, RuPay), UPI (Google Pay, PhonePe, Paytm), Net Banking &amp; Wallets</div>
                                <div style="display:flex; align-items:center; gap:8px; margin-top:8px; font-size:11px; color:var(--green); font-weight:700;">
                                    <span>&#128274; 256-bit Encrypted Checkout</span>
                                    <span>&bull;</span>
                                    <span>Powered by Razorpay</span>
                                </div>
                            </div>
                        </label>

                        <label class="ck-option" data-method="card">
                            <input type="radio" name="payment" value="card" />
                            <span class="ck-option-dot"></span>
                            <div class="ck-option-body">
                                <div class="ck-option-title">
                                    <span>Credit / Debit Card (via Razorpay)</span>
                                </div>
                                <div class="ck-option-desc">Visa, Mastercard, RuPay, Maestro &amp; Diners</div>
                            </div>
                        </label>

                        <label class="ck-option" data-method="upi">
                            <input type="radio" name="payment" value="upi" />
                            <span class="ck-option-dot"></span>
                            <div class="ck-option-body">
                                <div class="ck-option-title">
                                    <span>UPI QR &amp; Apps (via Razorpay)</span>
                                </div>
                                <div class="ck-option-desc">Instant payment via Google Pay, PhonePe, Paytm or UPI ID</div>
                            </div>
                        </label>

                        <label class="ck-option" data-method="cod">
                            <input type="radio" name="payment" value="cod" />
                            <span class="ck-option-dot"></span>
                            <div class="ck-option-body">
                                <div class="ck-option-title">
                                    <span>Cash on Delivery</span>
                                    <span class="ck-option-tag">+ &#8377; 40 fee</span>
                                </div>
                                <div class="ck-option-desc">Pay cash when package arrives at your delivery address</div>
                            </div>
                        </label>
                    </div>
                </section>

            </div>

            <!-- RIGHT: SUMMARY -->
            <aside class="ck-summary">
                <h2>Order Summary</h2>

                <div class="ck-summary-items" id="ckSummaryItems">
                    <% if (CartItemsTable != null) {
                        foreach (System.Data.DataRow item in CartItemsTable.Rows) {
                            string iName = item["ProductName"] != DBNull.Value ? item["ProductName"].ToString() : "Product";
                            string iSize = item["Size"] != DBNull.Value ? item["Size"].ToString() : "M";
                            int iQty = Convert.ToInt32(item["Quantity"]);
                            decimal iPrice = Convert.ToDecimal(item["Price"]);
                            string iImg = item["ImageUrl"] != DBNull.Value && !string.IsNullOrWhiteSpace(item["ImageUrl"].ToString())
                                ? item["ImageUrl"].ToString()
                                : "images/tshirt.png";
                            if (!iImg.StartsWith("http") && !iImg.StartsWith("/")) iImg = "~/" + iImg;
                    %>
                        <div class="ck-summary-item">
                            <div class="ck-summary-img">
                                <img src="<%= ResolveUrl(iImg) %>" alt="<%: iName %>" />
                            </div>
                            <div class="ck-summary-body">
                                <div class="ck-summary-name"><%: iName %></div>
                                <div class="ck-summary-meta">Size: <%= iSize %> &middot; Qty <%= iQty %></div>
                            </div>
                            <div class="ck-summary-price">&#8377; <%= (iPrice * iQty).ToString("N0") %></div>
                        </div>
                    <%  }
                    } %>
                </div>

                <div class="ck-summary-row">
                    <span>Subtotal</span>
                    <span id="ckSubtotal">&#8377; <%= Subtotal.ToString("N0") %></span>
                </div>
                <div class="ck-summary-row">
                    <span>Shipping</span>
                    <span id="ckShipping"><%= ShippingFee == 0 ? "Free" : ("&#8377; " + ShippingFee.ToString("N0")) %></span>
                </div>
                <% if (Savings > 0) { %>
                    <div class="ck-summary-row discount">
                        <span>Savings</span>
                        <span id="ckDiscount">&minus; &#8377; <%= Savings.ToString("N0") %></span>
                    </div>
                <% } %>
                <div class="ck-summary-row discount" id="ckCouponRow" style="<%= CouponDiscount > 0 ? "display:flex;" : "display:none;" %>">
                    <span>Coupon Discount</span>
                    <span id="ckCouponDiscountVal">&minus; &#8377; <%= CouponDiscount.ToString("N0") %></span>
                </div>
                <div class="ck-summary-row">
                    <span>Payment fee</span>
                    <span id="ckPaymentFee">&mdash;</span>
                </div>
                <div class="ck-summary-row total">
                    <span>Total</span>
                    <span id="ckTotal" data-base-total="<%= Total %>">&#8377; <%= Total.ToString("N0") %></span>
                </div>

                <div class="ck-place-order">
                    <button type="button" class="ck-btn" id="ckPlaceOrderBtn">
                        Place Order &#8594;
                    </button>
                    <a href="<%= ResolveUrl("~/cart.aspx") %>" class="ck-btn-ghost">Back to Cart</a>
                </div>

                <div class="ck-secure">Secure SSL checkout</div>

                <p class="ck-note">
                    By placing your order you agree to our
                    <a href="#" class="ck-link">Terms</a> and
                    <a href="#" class="ck-link">Privacy Policy</a>.
                    <strong>Free returns</strong> within 7 days.
                </p>
            </aside>

        </div>

    </div>
</div>

<script type="text/javascript">
(function() {
    var root = document.querySelector(".checkout-page");
    if (!root) return;

    /* ================= DOM ================= */
    var subtotalEl = root.querySelector("#ckSubtotal");
    var shippingEl = root.querySelector("#ckShipping");
    var discountEl = root.querySelector("#ckDiscount");
    var paymentFeeEl = root.querySelector("#ckPaymentFee");
    var totalEl = root.querySelector("#ckTotal");
    var placeOrderBtn = root.querySelector("#ckPlaceOrderBtn");

    var emailInput = root.querySelector("#ckEmail");
    var phoneInput = root.querySelector("#ckPhone");
    var firstNameInput = root.querySelector("#ckFirstName");
    var lastNameInput = root.querySelector("#ckLastName");
    var address1Input = root.querySelector("#ckAddress1");
    var address2Input = root.querySelector("#ckAddress2");
    var cityInput = root.querySelector("#ckCity");
    var stateInput = root.querySelector("#ckState");
    var pincodeInput = root.querySelector("#ckPincode");

    var cardNumberInput = root.querySelector("#ckCardNumber");
    var cardExpiryInput = root.querySelector("#ckCardExpiry");
    var cardCvvInput = root.querySelector("#ckCardCvv");
    var upiIdInput = root.querySelector("#ckUpiId");

    var cardFields = root.querySelector("#ckCardFields");
    var upiFields = root.querySelector("#ckUpiFields");

    var deliveryOptions = Array.prototype.slice.call(root.querySelectorAll("#ckDeliveryOptions .ck-option"));
    var paymentOptions = Array.prototype.slice.call(root.querySelectorAll("#ckPaymentOptions .ck-option"));

    /* ================= STATE ================= */
    var BASE_SUBTOTAL = <%= Subtotal %>;
    var BASE_SAVINGS = <%= Savings %>;
    var couponDiscount = <%= CouponDiscount %>;
    var couponCode = "<%: CouponCode %>";

    try {
        var savedCoupon = sessionStorage.getItem('appliedCoupon');
        if (savedCoupon) {
            var cData = JSON.parse(savedCoupon);
            if (cData && typeof cData.discount !== 'undefined' && parseFloat(cData.discount) > 0) {
                couponDiscount = parseFloat(cData.discount) || couponDiscount;
                couponCode = cData.code || couponCode;
            }
        }
    } catch(e) {}

    var cRow = root.querySelector('#ckCouponRow');
    var cVal = root.querySelector('#ckCouponDiscountVal');
    if (couponDiscount > 0 && cRow && cVal) {
        cRow.style.display = 'flex';
        cVal.textContent = '- ₹ ' + Math.round(couponDiscount).toLocaleString('en-IN');
    }

    var state = {
        deliveryMethod: "standard",
        deliveryFee: <%= Subtotal >= 2000 ? 0 : 99 %>,
        paymentFee: 0,
        paymentMethod: "razorpay"
    };

    /* ================= HELPERS ================= */
    function formatINR(value) {
        return "\u20B9 " + Math.round(value).toLocaleString("en-IN");
    }

    function getCurrentTotal() {
        return Math.max(0, BASE_SUBTOTAL + state.deliveryFee + state.paymentFee - couponDiscount);
    }

    function updateButtonText() {
        var total = getCurrentTotal();
        if (state.paymentMethod === "cod") {
            placeOrderBtn.innerHTML = "Place Order with Cash on Delivery &#8594;";
        } else {
            placeOrderBtn.innerHTML = "Pay " + formatINR(total) + " via Razorpay &#128274;";
        }
    }

    function updateTotals() {
        var total = getCurrentTotal();

        subtotalEl.innerHTML = formatINR(BASE_SUBTOTAL);
        shippingEl.innerHTML = state.deliveryFee === 0 ? "Free" : formatINR(state.deliveryFee);
        paymentFeeEl.innerHTML = state.paymentFee === 0 ? "&mdash;" : formatINR(state.paymentFee);
        totalEl.innerHTML = formatINR(total);
        updateButtonText();
    }

    // Initialize totals on load
    updateTotals();

    function setSelectedOption(options, selectedEl, inputName) {
        options.forEach(function(opt) {
            var radio = opt.querySelector("input[type='radio']");
            var isThis = opt === selectedEl;
            opt.classList.toggle("selected", isThis);
            if (radio) radio.checked = isThis;
        });
    }

    /* ================= DELIVERY OPTIONS ================= */
    deliveryOptions.forEach(function(opt) {
        opt.addEventListener("click", function(e) {
            e.preventDefault();
            var method = opt.getAttribute("data-method");
            state.deliveryMethod = method;

            if (method === "express") state.deliveryFee = 99;
            else if (method === "sameday") state.deliveryFee = 199;
            else state.deliveryFee = <%= Subtotal >= 2000 ? 0 : 99 %>;

            setSelectedOption(deliveryOptions, opt, "delivery");
            updateTotals();
        });
    });

    /* ================= PAYMENT OPTIONS ================= */
    paymentOptions.forEach(function(opt) {
        opt.addEventListener("click", function(e) {
            e.preventDefault();
            var method = opt.getAttribute("data-method");
            state.paymentMethod = method;
            state.paymentFee = (method === "cod") ? 40 : 0;

            setSelectedOption(paymentOptions, opt, "payment");
            updateTotals();
        });
    });

    /* ================= INPUT FORMATTING ================= */
    if (pincodeInput) {
        pincodeInput.addEventListener("input", function() {
            this.value = this.value.replace(/\D/g, "").slice(0, 6);
        });
    }

    if (phoneInput) {
        phoneInput.addEventListener("input", function() {
            this.value = this.value.replace(/\D/g, "").slice(0, 10);
        });
    }

    /* ================= VALIDATION ================= */
    var EMAIL_REGEX = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;

    function setError(input, errorEl, message) {
        if (input) input.classList.toggle("invalid", !!message);
        if (errorEl) errorEl.textContent = message || "";
    }

    function validateAll() {
        var ok = true;

        /* Email */
        var emailErr = "";
        if (!emailInput.value.trim()) emailErr = "Email is required.";
        else if (!EMAIL_REGEX.test(emailInput.value.trim())) emailErr = "Enter a valid email address.";
        setError(emailInput, root.querySelector("#ckEmailError"), emailErr);
        if (emailErr) ok = false;

        /* Phone */
        var phoneErr = "";
        var phoneDigits = phoneInput.value.replace(/\D/g, "");
        if (!phoneDigits) phoneErr = "Phone number is required.";
        else if (phoneDigits.length < 10) phoneErr = "Enter a valid 10-digit phone number.";
        setError(phoneInput, root.querySelector("#ckPhoneError"), phoneErr);
        if (phoneErr) ok = false;

        /* First Name */
        var fnErr = firstNameInput.value.trim() ? "" : "First name is required.";
        setError(firstNameInput, root.querySelector("#ckFirstNameError"), fnErr);
        if (fnErr) ok = false;

        /* Last Name */
        var lnErr = lastNameInput.value.trim() ? "" : "Last name is required.";
        setError(lastNameInput, root.querySelector("#ckLastNameError"), lnErr);
        if (lnErr) ok = false;

        /* Address 1 */
        var a1Err = address1Input.value.trim() ? "" : "Address is required.";
        setError(address1Input, root.querySelector("#ckAddress1Error"), a1Err);
        if (a1Err) ok = false;

        /* City */
        var cityErr = cityInput.value.trim() ? "" : "City is required.";
        setError(cityInput, root.querySelector("#ckCityError"), cityErr);
        if (cityErr) ok = false;

        /* State */
        var stateErr = stateInput.value.trim() ? "" : "State is required.";
        setError(stateInput, root.querySelector("#ckStateError"), stateErr);
        if (stateErr) ok = false;

        /* PIN */
        var pinErr = "";
        var pinDigits = pincodeInput.value.replace(/\D/g, "");
        if (!pinDigits) pinErr = "PIN code is required.";
        else if (pinDigits.length !== 6) pinErr = "Enter a valid 6-digit PIN code.";
        setError(pincodeInput, root.querySelector("#ckPincodeError"), pinErr);
        if (pinErr) ok = false;

        return ok;
    }

    /* ================= SUBMIT ORDER HELPER ================= */
    function submitOrderToBackend(payInfo) {
        var fd = new URLSearchParams();
        fd.append('action', 'place_order');
        fd.append('firstName', firstNameInput.value.trim());
        fd.append('lastName', lastNameInput.value.trim());
        fd.append('email', emailInput.value.trim());
        fd.append('phone', phoneInput.value.trim());
        fd.append('address1', address1Input.value.trim());
        fd.append('address2', address2Input ? address2Input.value.trim() : '');
        fd.append('city', cityInput.value.trim());
        fd.append('state', stateInput.value.trim());
        fd.append('pincode', pincodeInput.value.trim());
        fd.append('deliveryMethod', state.deliveryMethod);
        fd.append('paymentMethod', payInfo.paymentMethod || state.paymentMethod);
        fd.append('paymentId', payInfo.paymentId || '');
        fd.append('paymentStatus', payInfo.paymentStatus || 'Pending');
        fd.append('couponCode', couponCode);

        fetch('<%= ResolveUrl("~/Api.ashx") %>', {
            method: 'POST',
            headers: { 'Content-Type': 'application/x-www-form-urlencoded' },
            body: fd.toString()
        })
        .then(function(res) { return res.json(); })
        .then(function(data) {
            if (data.success) {
                sessionStorage.removeItem('appliedCoupon');
                if (window.updateSiteBadges) window.updateSiteBadges(0);
                window.location.href = data.redirectUrl || ('<%= ResolveUrl("~/success.aspx") %>?order=' + data.orderId);
            } else if (data.requireLogin && data.redirectUrl) {
                alert(data.message || 'Please log in to complete your order.');
                window.location.href = data.redirectUrl;
            } else {
                alert(data.message || 'Error processing order');
                placeOrderBtn.disabled = false;
                updateButtonText();
            }
        })
        .catch(function(err) {
            alert('Connection error while creating order.');
            placeOrderBtn.disabled = false;
            updateButtonText();
        });
    }

    /* ================= PLACE ORDER BUTTON CLICK ================= */
    placeOrderBtn.addEventListener("click", function() {
        if (!validateAll()) {
            var firstInvalid = root.querySelector(".ck-input.invalid");
            if (firstInvalid) {
                firstInvalid.scrollIntoView({ behavior: "smooth", block: "center" });
                firstInvalid.focus({ preventScroll: true });
            }
            return;
        }

        var total = getCurrentTotal();

        // If Cash on Delivery, place directly
        if (state.paymentMethod === "cod") {
            placeOrderBtn.disabled = true;
            placeOrderBtn.textContent = "Placing Order...";
            submitOrderToBackend({
                paymentMethod: "Cash on Delivery",
                paymentId: "",
                paymentStatus: "Pending"
            });
            return;
        }

        // Otherwise open Razorpay Checkout Modal
        if (typeof Razorpay === "undefined") {
            alert("Payment gateway is loading. Please check your internet connection.");
            return;
        }

        placeOrderBtn.disabled = true;
        placeOrderBtn.textContent = "Opening Secure Razorpay...";

        var totalInPaise = Math.round(total * 100);
        var custName = (firstNameInput.value.trim() + " " + lastNameInput.value.trim()).trim();

        var rzpOptions = {
            key: "<%= RazorpayKeyId %>",
            amount: totalInPaise,
            currency: "INR",
            name: "TEXTILES",
            description: "Menswear Order Checkout",
            image: "<%= ResolveUrl("~/images/tshirt.png") %>",
            prefill: {
                name: custName,
                email: emailInput.value.trim(),
                contact: phoneInput.value.trim()
            },
            notes: {
                address: address1Input.value.trim() + ", " + cityInput.value.trim() + " - " + pincodeInput.value.trim(),
                method: state.paymentMethod
            },
            theme: {
                color: "#08783c"
            },
            handler: function(response) {
                placeOrderBtn.disabled = true;
                placeOrderBtn.textContent = "Payment Verified! Creating order...";
                submitOrderToBackend({
                    paymentMethod: "Razorpay (" + state.paymentMethod.toUpperCase() + ")",
                    paymentId: response.razorpay_payment_id,
                    paymentStatus: "Paid"
                });
            },
            modal: {
                ondismiss: function() {
                    placeOrderBtn.disabled = false;
                    updateButtonText();
                }
            }
        };

        try {
            var rzp = new Razorpay(rzpOptions);
            rzp.on('payment.failed', function(resp) {
                var reason = (resp && resp.error) ? resp.error.description : "Transaction declined";
                alert("Payment Failed: " + reason);
                placeOrderBtn.disabled = false;
                updateButtonText();
            });
            rzp.open();
        } catch(ex) {
            alert("Could not open Razorpay checkout: " + ex.message);
            placeOrderBtn.disabled = false;
            updateButtonText();
        }
    });

    /* ================= INIT ================= */
    updateTotals();
})();
</script>

</asp:Content>