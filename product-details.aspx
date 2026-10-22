<%@ Page Title="Product Details | TEXTILES" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="product-details.aspx.cs" Inherits="SE_Project.product_details" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<div class="pd-page">
    <div class="pd-container">

        <!-- ================= BREADCRUMB ================= -->
        <nav class="pd-breadcrumb" aria-label="Breadcrumb">
            <a href="<%= ResolveUrl("~/products.aspx") %>">Shop</a>
            <span class="bc-sep">&#8250;</span>
            <a href="<%= ResolveUrl("~/products.aspx?cat=men") %>">Men</a>
            <span class="bc-sep">&#8250;</span>
            <a href="<%= ResolveUrl("~/products.aspx?cat=shirts") %>">Shirts</a>
            <span class="bc-sep">&#8250;</span>
            <span class="bc-current">Printed Cotton Shirt</span>

            <button type="button"
                    class="pd-wishlist"
                    id="wishlistBtn"
                    aria-label="Add to wishlist"
                    aria-pressed="false">
                <span class="heart-icon">&#9825;</span>
            </button>
        </nav>

        <!-- ================= MAIN GRID ================= -->
        <div class="pd-grid">

            <!-- ===== GALLERY ===== -->
            <section class="pd-gallery">
                <div class="pd-thumbs" role="tablist" aria-label="Product images">
                    <button type="button" class="pd-thumb active"
                            data-img="<%= ResolveUrl("~/Images/product-tee.jpg") %>"
                            aria-label="View image 1">
                        <img src="<%= ResolveUrl("~/Images/product-tee.jpg") %>" alt="Front view" />
                    </button>

                    <button type="button" class="pd-thumb"
                            data-img="<%= ResolveUrl("~/Images/product-shirt.jpg") %>"
                            aria-label="View image 2">
                        <img src="<%= ResolveUrl("~/Images/product-shirt.jpg") %>" alt="Side view" />
                    </button>

                    <button type="button" class="pd-thumb"
                            data-img="<%= ResolveUrl("~/Images/product-hoodie.jpg") %>"
                            aria-label="View image 3">
                        <img src="<%= ResolveUrl("~/Images/product-hoodie.jpg") %>" alt="Back view" />
                    </button>
                </div>

                <div class="pd-main-image" id="mainImageWrap">
                    <img src="<%= ResolveUrl("~/Images/product-tee.jpg") %>"
                         alt="Printed Cotton Shirt"
                         id="mainImage" />

                    <span class="pd-sale-badge">31% OFF</span>

                    <div class="pd-image-hint">
                        <span>&#128269;</span>
                        <span>Click to zoom</span>
                    </div>
                </div>
            </section>

            <!-- ===== INFO PANEL ===== -->
            <section class="pd-info">

                <span class="pd-brand-tag">TEXTILES &#183; ESSENTIALS</span>

                <h1 class="pd-title">Printed Cotton Shirt</h1>

                <!-- Rating -->
                <div class="pd-rating-row">
                    <span class="pd-stars" aria-hidden="true">
                        <span>&#9733;</span>
                        <span>&#9733;</span>
                        <span>&#9733;</span>
                        <span>&#9733;</span>
                        <span class="star-half">&#9733;</span>
                    </span>
                    <span class="pd-rating-value">4.5</span>
                    <span class="pd-rating-count">(128 Customer Reviews)</span>
                    <span class="pd-stock-tag">
                        <span class="stock-dot"></span>
                        In Stock
                    </span>
                </div>

                <!-- Price -->
                <div class="pd-price-row">
                    <span class="pd-price">&#8377;799</span>
                    <span class="pd-old-price">&#8377;1,299</span>
                    <span class="pd-discount">31% OFF</span>
                    <span class="pd-price-note">Inclusive of all taxes</span>
                </div>

                <!-- Description -->
                <div class="pd-description">
                    <h3>Description:</h3>
                    <p>
                        Premium quality cotton shirt for men. Crafted with breathable,
                        organic weave textiles. Perfect for casual and semi-formal
                        occasions alike.
                    </p>
                </div>

               
                <!-- Size selection -->
                <div class="pd-option-block">
                    <div class="pd-option-head">
                        <span class="pd-option-label">Size</span>
                        <button type="button" class="pd-size-guide" id="sizeGuideBtn">
                            Size Guide
                        </button>
                    </div>
                    <div class="pd-size-options" id="sizeOptions">
                        <button type="button" class="size-chip" data-size="S">S</button>
                        <button type="button" class="size-chip" data-size="M">M</button>
                        <button type="button" class="size-chip active" data-size="L">L</button>
                        <button type="button" class="size-chip" data-size="XL">XL</button>
                        <button type="button" class="size-chip" data-size="XXL">XXL</button>
                    </div>
                </div>

                <!-- Quantity -->
                <div class="pd-quantity-row">
                    <label for="qtyInput" class="pd-qty-label">Quantity</label>

                    <div class="pd-qty-control">
                        <button type="button" class="qty-btn" id="qtyMinus" aria-label="Decrease quantity">&#8722;</button>
                        <input type="number"
                               id="qtyInput"
                               class="qty-input"
                               value="1"
                               min="1"
                               max="99"
                               aria-label="Quantity" />
                        <button type="button" class="qty-btn" id="qtyPlus" aria-label="Increase quantity">&#43;</button>
                    </div>

                    <span class="pd-qty-note">Max 5 per order</span>
                </div>

                <!-- Actions -->
                <div class="pd-actions">
                    <button type="button" class="pd-btn pd-btn-outline" id="addToCartBtn">
                        <span class="btn-icon">&#128722;</span>
                        <span>Add to Cart</span>
                    </button>

                    <button type="button" class="pd-btn pd-btn-solid" id="buyNowBtn">
                        <span>Buy Now</span>
                        <span class="btn-arrow">&#8594;</span>
                    </button>
                </div>

                <!-- Delivery check -->
                <div class="pd-delivery">
                    <h4>Check Delivery</h4>
                    <div class="pd-delivery-form">
                        <input type="text"
                               id="pinInput"
                               class="pd-pin-input"
                               placeholder="Enter PIN code"
                               maxlength="6"
                               aria-label="PIN code" />
                        <button type="button" class="pd-pin-btn" id="checkPinBtn">Check</button>
                    </div>
                    <span class="pd-pin-message" id="pinMessage" aria-live="polite"></span>
                </div>

                <!-- Trust badges -->
                <div class="pd-trust">
                    <div class="trust-item">
                        <span class="trust-icon">&#10003;</span>
                        <div>
                            <strong>Free Delivery</strong>
                            <span>On orders over &#8377;999</span>
                        </div>
                    </div>

                    <div class="trust-item">
                        <span class="trust-icon">&#8635;</span>
                        <div>
                            <strong>Easy Returns</strong>
                            <span>7-day return policy</span>
                        </div>
                    </div>

                    <div class="trust-item">
                        <span class="trust-icon">&#128274;</span>
                        <div>
                            <strong>Secure Payment</strong>
                            <span>100% protected</span>
                        </div>
                    </div>
                </div>

            </section>

        </div>

        <!-- ================= DETAIL TABS ================= -->
        <section class="pd-details-section">

            <div class="pd-tabs" role="tablist">
                <button type="button" class="pd-tab active" data-tab="specs" role="tab" aria-selected="true">
                    Specifications
                </button>
                <button type="button" class="pd-tab" data-tab="features" role="tab" aria-selected="false">
                    Features
                </button>
                <button type="button" class="pd-tab" data-tab="shipping" role="tab" aria-selected="false">
                    Shipping &amp; Returns
                </button>
                <button type="button" class="pd-tab" data-tab="care" role="tab" aria-selected="false">
                    Care Instructions
                </button>
            </div>

            <!-- Specifications -->
            <div class="pd-tab-panel active" data-panel="specs">
                <div class="pd-specs-grid">
                    <div class="spec-row">
                        <span class="spec-key">Material</span>
                        <span class="spec-val">100% Organic Cotton</span>
                    </div>
                    <div class="spec-row">
                        <span class="spec-key">Fit</span>
                        <span class="spec-val">Regular Fit</span>
                    </div>
                    <div class="spec-row">
                        <span class="spec-key">Pattern</span>
                        <span class="spec-val">Graphic Print</span>
                    </div>
                    <div class="spec-row">
                        <span class="spec-key">Sleeve</span>
                        <span class="spec-val">Short Sleeve</span>
                    </div>
                    <div class="spec-row">
                        <span class="spec-key">Collar</span>
                        <span class="spec-val">Round Neck</span>
                    </div>
                    <div class="spec-row">
                        <span class="spec-key">Occasion</span>
                        <span class="spec-val">Casual, Semi-Formal</span>
                    </div>
                    <div class="spec-row">
                        <span class="spec-key">Country of Origin</span>
                        <span class="spec-val">India</span>
                    </div>
                    <div class="spec-row">
                        <span class="spec-key">SKU</span>
                        <span class="spec-val">TX-PCS-001</span>
                    </div>
                </div>
            </div>

            <!-- Features -->
            <div class="pd-tab-panel" data-panel="features">
                <ul class="pd-feature-list">
                    <li>
                        <span class="feature-bullet">&#10003;</span>
                        <div>
                            <strong>Breathable Organic Weave</strong>
                            <p>Woven from long-staple organic cotton for all-day comfort.</p>
                        </div>
                    </li>
                    <li>
                        <span class="feature-bullet">&#10003;</span>
                        <div>
                            <strong>Fade-Resistant Print</strong>
                            <p>Screen-printed graphic that stays sharp after repeated washes.</p>
                        </div>
                    </li>
                    <li>
                        <span class="feature-bullet">&#10003;</span>
                        <div>
                            <strong>Reinforced Stitching</strong>
                            <p>Double-stitched shoulders and hem for durability.</p>
                        </div>
                    </li>
                    <li>
                        <span class="feature-bullet">&#10003;</span>
                        <div>
                            <strong>Tagless Comfort</strong>
                            <p>Printed neck label prevents irritation and itch.</p>
                        </div>
                    </li>
                </ul>
            </div>

            <!-- Shipping -->
            <div class="pd-tab-panel" data-panel="shipping">
                <div class="pd-ship-block">
                    <h4>&#128666; Shipping</h4>
                    <ul class="pd-ship-list">
                        <li>Standard delivery: 4–6 business days</li>
                        <li>Express delivery: 2–3 business days</li>
                        <li>Free shipping on orders above &#8377;999</li>
                        <li>Cash on Delivery available up to &#8377;5,000</li>
                    </ul>
                </div>

                <div class="pd-ship-block">
                    <h4>&#8635; Returns &amp; Exchange</h4>
                    <ul class="pd-ship-list">
                        <li>7-day easy return window from delivery date</li>
                        <li>Free size exchange for wrong fit</li>
                        <li>Refunds processed within 3–5 business days</li>
                        <li>Items must be unworn with original tags</li>
                    </ul>
                </div>
            </div>

            <!-- Care -->
            <div class="pd-tab-panel" data-panel="care">
                <ul class="pd-care-list">
                    <li><span class="care-icon">&#127777;</span> Machine wash cold</li>
                    <li><span class="care-icon">&#128167;</span> Do not bleach</li>
                    <li><span class="care-icon">&#9729;</span> Tumble dry low</li>
                    <li><span class="care-icon">&#9832;</span> Iron on reverse side</li>
                    <li><span class="care-icon">&#128142;</span> Do not dry clean</li>
                </ul>
            </div>

        </section>

        <!-- ================= REVIEWS ================= -->
        <section class="pd-reviews-section">
            <div class="pd-reviews-head">
                <h2>Customer Reviews</h2>
                <span class="pd-reviews-summary">
                    <span class="summary-star">&#9733;</span>
                    4.5 / 5 &#183; based on 128 reviews
                </span>
            </div>

            <div class="pd-reviews-grid">
                <article class="pd-review">
                    <header class="review-head">
                        <div class="review-avatar">A</div>
                        <div>
                            <strong class="review-name">Aarav M.</strong>
                            <span class="review-date">Verified Purchase &#183; 2 weeks ago</span>
                        </div>
                        <span class="review-stars">&#9733;&#9733;&#9733;&#9733;&#9733;</span>
                    </header>
                    <p class="review-text">
                        Fabric feels premium and the print quality is fantastic.
                        Fits true to size. Would definitely buy again.
                    </p>
                </article>

                <article class="pd-review">
                    <header class="review-head">
                        <div class="review-avatar">R</div>
                        <div>
                            <strong class="review-name">Rohan K.</strong>
                            <span class="review-date">Verified Purchase &#183; 1 month ago</span>
                        </div>
                        <span class="review-stars">&#9733;&#9733;&#9733;&#9733;&#9734;</span>
                    </header>
                    <p class="review-text">
                        Great comfort for daily wear. Slightly loose fit but that's
                        what I prefer. Colour is exactly like the photo.
                    </p>
                </article>

                <article class="pd-review">
                    <header class="review-head">
                        <div class="review-avatar">S</div>
                        <div>
                            <strong class="review-name">Sanjay P.</strong>
                            <span class="review-date">Verified Purchase &#183; 1 month ago</span>
                        </div>
                        <span class="review-stars">&#9733;&#9733;&#9733;&#9733;&#9733;</span>
                    </header>
                    <p class="review-text">
                        Ordered two of these. Stitching and finish are top-notch
                        for this price point. Highly recommended.
                    </p>
                </article>
            </div>
        </section>

    </div>

    <!-- Toast -->
    <div class="pd-toast" id="pdToast" aria-live="polite"></div>

    <!-- Size guide modal -->
    <div class="pd-modal" id="sizeModal" role="dialog" aria-modal="true" aria-labelledby="sizeModalTitle">
        <div class="pd-modal-backdrop" data-close="sizeModal"></div>
        <div class="pd-modal-panel">
            <header class="pd-modal-head">
                <h3 id="sizeModalTitle">Size Guide</h3>
                <button type="button" class="pd-modal-close" data-close="sizeModal" aria-label="Close">&#10005;</button>
            </header>

            <div class="pd-modal-body">
                <table class="pd-size-table">
                    <thead>
                        <tr>
                            <th>Size</th>
                            <th>Chest (in)</th>
                            <th>Length (in)</th>
                            <th>Shoulder (in)</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr><td>S</td><td>38</td><td>27</td><td>16.5</td></tr>
                        <tr><td>M</td><td>40</td><td>28</td><td>17.5</td></tr>
                        <tr><td>L</td><td>42</td><td>29</td><td>18.5</td></tr>
                        <tr><td>XL</td><td>44</td><td>30</td><td>19.5</td></tr>
                        <tr><td>XXL</td><td>46</td><td>31</td><td>20.5</td></tr>
                    </tbody>
                </table>
            </div>
        </div>
    </div>

</div>

<style>
    /* ================= PAGE WRAPPER ================= */
    .pd-page {
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

        background: var(--cream);
        font-family: 'Segoe UI', Arial, sans-serif;
        color: var(--dark);
        padding: 26px 5% 60px;
        min-height: 85vh;
    }

    .pd-page *,
    .pd-page *::before,
    .pd-page *::after {
        box-sizing: border-box;
    }

    .pd-container {
        max-width: 1400px;
        margin: 0 auto;
    }

    /* ================= ANIMATIONS ================= */
    @keyframes pdFadeUp {
        from { opacity: 0; transform: translateY(22px); }
        to   { opacity: 1; transform: translateY(0); }
    }

    @keyframes pdFadeIn {
        from { opacity: 0; }
        to   { opacity: 1; }
    }

    @keyframes pdFloat {
        0%, 100% { transform: translateY(0); }
        50%      { transform: translateY(-6px); }
    }

    @keyframes pdHeartPop {
        0%   { transform: scale(1); }
        40%  { transform: scale(1.35); }
        100% { transform: scale(1); }
    }

    @keyframes pdModalIn {
        from { opacity: 0; transform: translateY(20px) scale(.96); }
        to   { opacity: 1; transform: translateY(0) scale(1); }
    }

    @keyframes stockPulse {
        0%, 100% { opacity: 1; transform: scale(1); }
        50%      { opacity: .6; transform: scale(.85); }
    }

    /* ================= BREADCRUMB ================= */
    .pd-breadcrumb {
        display: flex;
        align-items: center;
        gap: 8px;
        flex-wrap: wrap;
        margin-bottom: 26px;
        font-size: 12.5px;
        color: var(--muted);
        animation: pdFadeUp .5s var(--ease) both;
    }

    .pd-breadcrumb a {
        color: var(--muted);
        text-decoration: none;
        font-weight: 600;
        transition: color .2s var(--ease);
    }

    .pd-breadcrumb a:hover {
        color: var(--green);
    }

    .bc-sep {
        color: #c4c7c0;
    }

    .bc-current {
        color: var(--dark);
        font-weight: 700;
    }

    .pd-wishlist {
        margin-left: auto;
        width: 40px;
        height: 40px;
        display: grid;
        place-items: center;
        border: 1px solid var(--border);
        border-radius: 50%;
        background: #fff;
        color: var(--muted);
        cursor: pointer;
        transition: all .25s var(--ease);
    }

    .pd-wishlist:hover {
        border-color: #f3b6c5;
        color: #d93050;
        transform: translateY(-2px);
        box-shadow: 0 6px 14px rgba(217,48,80,.18);
    }

    .pd-wishlist.selected {
        background: #ffe9ef;
        border-color: #f3b6c5;
        color: #d93050;
    }

    .pd-wishlist.selected .heart-icon {
        animation: pdHeartPop .5s var(--ease);
    }

    .heart-icon {
        font-size: 18px;
        line-height: 1;
    }

    /* ================= MAIN GRID ================= */
    .pd-grid {
        display: grid;
        grid-template-columns: minmax(0, 1fr) minmax(0, 1fr);
        gap: 46px;
        align-items: start;
    }

    /* ================= GALLERY ================= */
    .pd-gallery {
        display: grid;
        grid-template-columns: 88px 1fr;
        gap: 16px;
        animation: pdFadeUp .6s .05s var(--ease) both;
    }

    .pd-thumbs {
        display: flex;
        flex-direction: column;
        gap: 12px;
    }

    .pd-thumb {
        width: 88px;
        height: 88px;
        padding: 0;
        border: 1.5px solid var(--border);
        border-radius: 10px;
        background: #fff;
        cursor: pointer;
        overflow: hidden;
        transition: all .25s var(--ease);
    }

    .pd-thumb img {
        width: 100%;
        height: 100%;
        object-fit: cover;
        display: block;
        transition: transform .4s var(--ease);
    }

    .pd-thumb:hover {
        border-color: var(--green);
        transform: translateY(-2px);
        box-shadow: 0 6px 14px rgba(8,120,60,.15);
    }

    .pd-thumb:hover img {
        transform: scale(1.06);
    }

    .pd-thumb.active {
        border-color: var(--green);
        box-shadow: 0 0 0 3px rgba(8,120,60,.14);
    }

    .pd-main-image {
        position: relative;
        aspect-ratio: 1 / 1;
        border-radius: 14px;
        background: #f4f1ec;
        overflow: hidden;
        cursor: zoom-in;
        animation: pdFadeIn .6s .15s var(--ease) both;
    }

    .pd-main-image img {
        width: 100%;
        height: 100%;
        object-fit: cover;
        display: block;
        transition: transform .6s var(--ease);
    }

    .pd-main-image.zoomed img {
        transform: scale(1.7);
    }

    .pd-main-image.zoomed {
        cursor: zoom-out;
    }

    .pd-sale-badge {
        position: absolute;
        top: 16px;
        left: 16px;
        padding: 7px 12px;
        border-radius: 5px;
        background: linear-gradient(135deg, var(--green), var(--green-light));
        color: #fff;
        font-size: 11px;
        font-weight: 800;
        letter-spacing: 1px;
        box-shadow: 0 4px 14px rgba(8,120,60,.4);
        animation: pdFloat 4s ease-in-out infinite;
    }

    .pd-image-hint {
        position: absolute;
        bottom: 14px;
        left: 50%;
        transform: translateX(-50%);
        display: inline-flex;
        align-items: center;
        gap: 6px;
        padding: 7px 12px;
        border-radius: 20px;
        background: rgba(32,37,31,.75);
        color: #fff;
        font-size: 11px;
        font-weight: 600;
        backdrop-filter: blur(6px);
        opacity: 0;
        transition: opacity .3s var(--ease);
        pointer-events: none;
    }

    .pd-main-image:hover .pd-image-hint {
        opacity: 1;
    }

    .pd-main-image.zoomed .pd-image-hint {
        opacity: 0;
    }

    /* ================= INFO PANEL ================= */
    .pd-info {
        animation: pdFadeUp .6s .1s var(--ease) both;
    }

    .pd-brand-tag {
        display: inline-block;
        margin-bottom: 12px;
        padding: 5px 10px;
        border-radius: 4px;
        background: rgba(8,120,60,.08);
        color: var(--green);
        font-size: 10.5px;
        font-weight: 800;
        letter-spacing: 1.8px;
    }

    .pd-title {
        margin: 0 0 14px;
        color: var(--dark);
        font-size: clamp(26px, 3vw, 36px);
        font-weight: 900;
        line-height: 1.15;
        letter-spacing: -.5px;
    }

    /* Rating */
    .pd-rating-row {
        display: flex;
        align-items: center;
        gap: 8px;
        flex-wrap: wrap;
        margin-bottom: 18px;
    }

    .pd-stars {
        display: inline-flex;
        gap: 1px;
        color: #e9b719;
        font-size: 15px;
        line-height: 1;
    }

    .star-half {
        opacity: .55;
    }

    .pd-rating-value {
        color: var(--dark);
        font-size: 13px;
        font-weight: 800;
    }

    .pd-rating-count {
        color: var(--muted);
        font-size: 12.5px;
    }

    .pd-stock-tag {
        display: inline-flex;
        align-items: center;
        gap: 6px;
        margin-left: auto;
        padding: 5px 10px;
        border-radius: 20px;
        background: rgba(8,120,60,.08);
        color: var(--green);
        font-size: 11px;
        font-weight: 800;
    }

    .stock-dot {
        width: 7px;
        height: 7px;
        border-radius: 50%;
        background: var(--green);
        box-shadow: 0 0 0 3px rgba(8,120,60,.2);
        animation: stockPulse 2s ease-in-out infinite;
    }

    /* Price */
    .pd-price-row {
        display: flex;
        align-items: center;
        gap: 12px;
        flex-wrap: wrap;
        margin-bottom: 24px;
        padding-bottom: 22px;
        border-bottom: 1px solid var(--border);
    }

    .pd-price {
        color: var(--dark);
        font-size: 30px;
        font-weight: 900;
        letter-spacing: -.5px;
    }

    .pd-old-price {
        color: #a9ada6;
        font-size: 17px;
        font-weight: 600;
        text-decoration: line-through;
    }

    .pd-discount {
        padding: 5px 10px;
        border-radius: 5px;
        background: rgba(8,120,60,.1);
        color: var(--green);
        font-size: 11.5px;
        font-weight: 800;
        letter-spacing: .5px;
    }

    .pd-price-note {
        width: 100%;
        margin-top: 4px;
        color: var(--muted);
        font-size: 11px;
    }

    /* Description */
    .pd-description {
        margin-bottom: 22px;
        padding: 16px 18px;
        border: 1px solid #d6ecdb;
        border-radius: 10px;
        background: #f3faf4;
        animation: pdFadeUp .6s .2s var(--ease) both;
    }

    .pd-description h3 {
        margin: 0 0 8px;
        color: var(--green);
        font-size: 13px;
        font-weight: 800;
        letter-spacing: .5px;
        text-transform: uppercase;
    }

    .pd-description p {
        margin: 0;
        color: #555a52;
        font-size: 13px;
        line-height: 1.8;
    }

    /* Option blocks (color / size) */
    .pd-option-block {
        margin-bottom: 20px;
        animation: pdFadeUp .6s .22s var(--ease) both;
    }

    .pd-option-head {
        display: flex;
        align-items: center;
        justify-content: space-between;
        gap: 10px;
        margin-bottom: 10px;
    }

    .pd-option-label {
        color: var(--dark);
        font-size: 13px;
        font-weight: 800;
    }

    .pd-option-value {
        color: var(--green);
        font-size: 12.5px;
        font-weight: 700;
    }

    .pd-size-guide {
        padding: 3px 8px;
        border: 0;
        border-radius: 4px;
        background: transparent;
        color: var(--green);
        font-size: 11.5px;
        font-weight: 800;
        cursor: pointer;
        text-decoration: underline;
        transition: color .2s var(--ease);
    }

    .pd-size-guide:hover {
        color: var(--green-dark);
    }

    /* Color swatches */
    .pd-color-options {
        display: flex;
        gap: 10px;
    }

    .color-swatch {
        position: relative;
        width: 34px;
        height: 34px;
        border: 0;
        border-radius: 50%;
        background: var(--sw, #ccc);
        cursor: pointer;
        transition: transform .25s var(--ease-bounce), box-shadow .25s var(--ease);
        box-shadow: inset 0 0 0 1px rgba(0,0,0,.08);
    }

    .color-swatch:hover {
        transform: scale(1.1);
        box-shadow: inset 0 0 0 1px rgba(0,0,0,.08), 0 4px 12px rgba(0,0,0,.15);
    }

    .color-swatch.active {
        transform: scale(1.05);
        box-shadow: inset 0 0 0 1px rgba(0,0,0,.08), 0 0 0 2.5px #fff, 0 0 0 4.5px var(--green);
    }

    /* Size chips */
    .pd-size-options {
        display: flex;
        gap: 8px;
        flex-wrap: wrap;
    }

    .size-chip {
        min-width: 46px;
        height: 42px;
        padding: 0 12px;
        border: 1.5px solid var(--border);
        border-radius: 8px;
        background: #fff;
        color: var(--dark);
        font-size: 13px;
        font-weight: 800;
        cursor: pointer;
        transition: all .2s var(--ease);
    }

    .size-chip:hover {
        border-color: var(--green);
        color: var(--green);
        transform: translateY(-2px);
    }

    .size-chip.active {
        background: linear-gradient(135deg, var(--green), var(--green-light));
        border-color: var(--green);
        color: #fff;
        box-shadow: 0 6px 14px rgba(8,120,60,.32);
    }

    /* Quantity */
    .pd-quantity-row {
        display: flex;
        align-items: center;
        gap: 16px;
        flex-wrap: wrap;
        margin-bottom: 22px;
        animation: pdFadeUp .6s .25s var(--ease) both;
    }

    .pd-qty-label {
        color: var(--dark);
        font-size: 13.5px;
        font-weight: 800;
    }

    .pd-qty-note {
        color: var(--muted);
        font-size: 11px;
    }

    .pd-qty-control {
        display: inline-flex;
        align-items: center;
        border: 1.5px solid var(--border);
        border-radius: 9px;
        background: #fff;
        overflow: hidden;
        transition: border-color .25s var(--ease), box-shadow .25s var(--ease);
    }

    .pd-qty-control:focus-within {
        border-color: var(--green);
        box-shadow: 0 0 0 4px rgba(8,120,60,.12);
    }

    .qty-btn {
        width: 40px;
        height: 40px;
        border: 0;
        background: transparent;
        color: var(--dark);
        font-size: 18px;
        font-weight: 700;
        cursor: pointer;
        transition: background .2s var(--ease), color .2s var(--ease);
    }

    .qty-btn:hover {
        background: rgba(8,120,60,.08);
        color: var(--green);
    }

    .qty-btn:active {
        transform: scale(.92);
    }

    .qty-input {
        width: 56px;
        height: 40px;
        border: 0;
        border-left: 1.5px solid var(--border);
        border-right: 1.5px solid var(--border);
        background: #fff;
        color: var(--dark);
        text-align: center;
        font-size: 14px;
        font-weight: 800;
        outline: none;
        -moz-appearance: textfield;
    }

    .qty-input::-webkit-outer-spin-button,
    .qty-input::-webkit-inner-spin-button {
        -webkit-appearance: none;
        margin: 0;
    }

    /* Actions */
    .pd-actions {
        display: grid;
        grid-template-columns: 1fr 1fr;
        gap: 14px;
        margin-bottom: 14px;
        animation: pdFadeUp .6s .3s var(--ease) both;
    }

    .pd-btn {
        position: relative;
        display: inline-flex;
        align-items: center;
        justify-content: center;
        gap: 8px;
        height: 54px;
        padding: 0 22px;
        border-radius: 9px;
        font-size: 14px;
        font-weight: 800;
        letter-spacing: .5px;
        cursor: pointer;
        overflow: hidden;
        transition: all .25s var(--ease);
    }

    .pd-btn-outline {
        border: 1.5px solid var(--green);
        background: #fff;
        color: var(--green);
    }

    .pd-btn-outline:hover {
        background: #f1f8f2;
        transform: translateY(-2px);
        box-shadow: 0 8px 18px rgba(8,120,60,.18);
    }

    .pd-btn-solid {
        border: 0;
        background: linear-gradient(135deg, var(--green), var(--green-light));
        color: #fff;
        box-shadow: 0 8px 20px rgba(8,120,60,.32);
    }

    .pd-btn-solid::before {
        content: '';
        position: absolute;
        top: 0;
        left: -100%;
        width: 100%;
        height: 100%;
        background: linear-gradient(90deg, transparent, rgba(255,255,255,.3), transparent);
        transition: left .6s var(--ease);
    }

    .pd-btn-solid:hover::before {
        left: 100%;
    }

    .pd-btn-solid:hover {
        transform: translateY(-2px);
        box-shadow: 0 14px 30px rgba(8,120,60,.42);
    }

    .pd-btn:active {
        transform: translateY(0);
    }

    .btn-icon {
        font-size: 16px;
    }

    .btn-arrow {
        transition: transform .3s var(--ease);
    }

    .pd-btn-solid:hover .btn-arrow {
        transform: translateX(4px);
    }

    /* Secondary actions */
    .pd-secondary-actions {
        display: flex;
        gap: 20px;
        margin-bottom: 22px;
        padding-bottom: 22px;
        border-bottom: 1px solid var(--border);
        animation: pdFadeUp .6s .32s var(--ease) both;
    }

    .pd-secondary-btn {
        display: inline-flex;
        align-items: center;
        gap: 6px;
        padding: 4px 0;
        border: 0;
        background: transparent;
        color: var(--muted);
        font-size: 12.5px;
        font-weight: 700;
        cursor: pointer;
        transition: color .2s var(--ease), transform .2s var(--ease);
    }

    .pd-secondary-btn:hover {
        color: var(--green);
        transform: translateY(-1px);
    }

    /* Delivery check */
    .pd-delivery {
        margin-bottom: 22px;
        padding: 16px 18px;
        border: 1px dashed #cfe4d4;
        border-radius: 10px;
        background: #f8fcf9;
        animation: pdFadeUp .6s .34s var(--ease) both;
    }

    .pd-delivery h4 {
        margin: 0 0 10px;
        color: var(--dark);
        font-size: 13px;
        font-weight: 800;
    }

    .pd-delivery-form {
        display: flex;
        gap: 8px;
    }

    .pd-pin-input {
        flex: 1;
        min-width: 0;
        height: 42px;
        padding: 0 14px;
        border: 1.5px solid var(--border);
        border-radius: 8px;
        background: #fff;
        color: var(--dark);
        font-size: 13px;
        outline: none;
        transition: border-color .25s var(--ease), box-shadow .25s var(--ease);
    }

    .pd-pin-input:focus {
        border-color: var(--green);
        box-shadow: 0 0 0 4px rgba(8,120,60,.12);
    }

    .pd-pin-btn {
        height: 42px;
        padding: 0 20px;
        border: 0;
        border-radius: 8px;
        background: linear-gradient(135deg, var(--green), var(--green-light));
        color: #fff;
        font-size: 12.5px;
        font-weight: 800;
        cursor: pointer;
        transition: transform .2s var(--ease), box-shadow .25s var(--ease);
    }

    .pd-pin-btn:hover {
        transform: translateY(-2px);
        box-shadow: 0 8px 18px rgba(8,120,60,.3);
    }

    .pd-pin-message {
        display: block;
        margin-top: 10px;
        font-size: 12px;
        font-weight: 700;
        color: var(--green);
        min-height: 16px;
    }

    .pd-pin-message.error {
        color: #d93050;
    }

    /* Trust */
    .pd-trust {
        display: grid;
        grid-template-columns: repeat(3, minmax(0, 1fr));
        gap: 12px;
        padding-top: 22px;
        border-top: 1px solid var(--border);
        animation: pdFadeUp .6s .38s var(--ease) both;
    }

    .trust-item {
        display: flex;
        align-items: flex-start;
        gap: 9px;
    }

    .trust-icon {
        display: grid;
        place-items: center;
        flex-shrink: 0;
        width: 32px;
        height: 32px;
        border-radius: 8px;
        background: rgba(8,120,60,.1);
        color: var(--green);
        font-size: 15px;
        font-weight: 800;
    }

    .trust-item strong {
        display: block;
        color: var(--dark);
        font-size: 12px;
        font-weight: 800;
    }

    .trust-item span {
        display: block;
        margin-top: 2px;
        color: var(--muted);
        font-size: 10.5px;
    }

    /* ================= DETAIL TABS ================= */
    .pd-details-section {
        margin-top: 60px;
        padding-top: 34px;
        border-top: 1px solid var(--border);
        animation: pdFadeUp .7s .4s var(--ease) both;
    }

    .pd-tabs {
        display: flex;
        gap: 4px;
        flex-wrap: wrap;
        border-bottom: 1px solid var(--border);
        margin-bottom: 26px;
    }

    .pd-tab {
        position: relative;
        padding: 12px 18px;
        border: 0;
        background: transparent;
        color: var(--muted);
        font-size: 13.5px;
        font-weight: 800;
        cursor: pointer;
        transition: color .25s var(--ease);
    }

    .pd-tab::after {
        content: '';
        position: absolute;
        left: 18px;
        right: 18px;
        bottom: -1px;
        height: 2.5px;
        border-radius: 3px;
        background: linear-gradient(90deg, var(--green), var(--gold));
        transform: scaleX(0);
        transform-origin: left;
        transition: transform .3s var(--ease);
    }

    .pd-tab:hover {
        color: var(--dark);
    }

    .pd-tab.active {
        color: var(--green);
    }

    .pd-tab.active::after {
        transform: scaleX(1);
    }

    .pd-tab-panel {
        display: none;
        animation: pdFadeIn .35s var(--ease);
    }

    .pd-tab-panel.active {
        display: block;
    }

    /* Specs */
    .pd-specs-grid {
        display: grid;
        grid-template-columns: repeat(2, minmax(0, 1fr));
        gap: 0;
        border: 1px solid var(--border);
        border-radius: 12px;
        overflow: hidden;
        background: #fff;
    }

    .spec-row {
        display: flex;
        align-items: center;
        justify-content: space-between;
        gap: 12px;
        padding: 14px 18px;
        border-bottom: 1px solid var(--border);
        transition: background .2s var(--ease);
    }

    .spec-row:nth-child(odd) {
        border-right: 1px solid var(--border);
    }

    .spec-row:nth-last-child(-n+2) {
        border-bottom: 0;
    }

    .spec-row:hover {
        background: #f8fcf9;
    }

    .spec-key {
        color: var(--muted);
        font-size: 12.5px;
        font-weight: 700;
    }

    .spec-val {
        color: var(--dark);
        font-size: 12.5px;
        font-weight: 800;
        text-align: right;
    }

    /* Features */
    .pd-feature-list {
        display: grid;
        grid-template-columns: repeat(2, minmax(0, 1fr));
        gap: 16px;
        list-style: none;
        margin: 0;
        padding: 0;
    }

    .pd-feature-list li {
        display: flex;
        gap: 12px;
        padding: 18px;
        border: 1px solid var(--border);
        border-radius: 11px;
        background: #fff;
        transition: transform .25s var(--ease), box-shadow .25s var(--ease), border-color .25s var(--ease);
    }

    .pd-feature-list li:hover {
        transform: translateY(-3px);
        box-shadow: 0 10px 22px rgba(0,0,0,.06);
        border-color: #cfe4d4;
    }

    .feature-bullet {
        display: grid;
        place-items: center;
        flex-shrink: 0;
        width: 32px;
        height: 32px;
        border-radius: 8px;
        background: rgba(8,120,60,.1);
        color: var(--green);
        font-size: 15px;
        font-weight: 800;
    }

    .pd-feature-list strong {
        display: block;
        color: var(--dark);
        font-size: 13px;
        font-weight: 800;
        margin-bottom: 5px;
    }

    .pd-feature-list p {
        margin: 0;
        color: var(--muted);
        font-size: 12px;
        line-height: 1.7;
    }

    /* Shipping */
    .pd-ship-block {
        padding: 20px 22px;
        border: 1px solid var(--border);
        border-radius: 12px;
        background: #fff;
        margin-bottom: 16px;
    }

    .pd-ship-block h4 {
        margin: 0 0 12px;
        color: var(--dark);
        font-size: 14px;
        font-weight: 800;
    }

    .pd-ship-list {
        margin: 0;
        padding: 0;
        list-style: none;
        display: grid;
        gap: 9px;
    }

    .pd-ship-list li {
        position: relative;
        padding-left: 22px;
        color: #555a52;
        font-size: 12.5px;
        line-height: 1.6;
    }

    .pd-ship-list li::before {
        content: '✓';
        position: absolute;
        left: 0;
        top: 0;
        color: var(--green);
        font-weight: 900;
    }

    /* Care */
    .pd-care-list {
        display: grid;
        grid-template-columns: repeat(3, minmax(0, 1fr));
        gap: 14px;
        list-style: none;
        margin: 0;
        padding: 0;
    }

    .pd-care-list li {
        display: flex;
        align-items: center;
        gap: 12px;
        padding: 18px;
        border: 1px solid var(--border);
        border-radius: 11px;
        background: #fff;
        color: var(--dark);
        font-size: 12.5px;
        font-weight: 700;
        transition: transform .25s var(--ease), box-shadow .25s var(--ease);
    }

    .pd-care-list li:hover {
        transform: translateY(-3px);
        box-shadow: 0 10px 22px rgba(0,0,0,.06);
    }

    .care-icon {
        font-size: 20px;
    }

    /* ================= REVIEWS ================= */
    .pd-reviews-section {
        margin-top: 60px;
        padding-top: 34px;
        border-top: 1px solid var(--border);
        animation: pdFadeUp .7s .45s var(--ease) both;
    }

    .pd-reviews-head {
        display: flex;
        align-items: center;
        justify-content: space-between;
        gap: 14px;
        flex-wrap: wrap;
        margin-bottom: 22px;
    }

    .pd-reviews-head h2 {
        margin: 0;
        color: var(--dark);
        font-size: 22px;
        font-weight: 900;
        position: relative;
        padding-bottom: 10px;
    }

    .pd-reviews-head h2::after {
        content: '';
        position: absolute;
        left: 0;
        bottom: 0;
        width: 40px;
        height: 3px;
        border-radius: 3px;
        background: linear-gradient(90deg, var(--green), var(--gold));
    }

    .pd-reviews-summary {
        color: var(--muted);
        font-size: 12.5px;
        font-weight: 700;
    }

    .summary-star {
        color: #e9b719;
        font-size: 14px;
    }

    .pd-reviews-grid {
        display: grid;
        grid-template-columns: repeat(3, minmax(0, 1fr));
        gap: 16px;
    }

    .pd-review {
        padding: 20px;
        border: 1px solid var(--border);
        border-radius: 12px;
        background: #fff;
        transition: transform .3s var(--ease), box-shadow .3s var(--ease), border-color .3s var(--ease);
    }

    .pd-review:hover {
        transform: translateY(-4px);
        box-shadow: 0 12px 26px rgba(0,0,0,.08);
        border-color: #cfe4d4;
    }

    .review-head {
        display: flex;
        align-items: center;
        gap: 12px;
        margin-bottom: 12px;
        flex-wrap: wrap;
    }

    .review-avatar {
        display: grid;
        place-items: center;
        width: 40px;
        height: 40px;
        border-radius: 50%;
        background: linear-gradient(135deg, var(--green), var(--green-light));
        color: #fff;
        font-size: 15px;
        font-weight: 800;
    }

    .review-name {
        display: block;
        color: var(--dark);
        font-size: 13px;
        font-weight: 800;
    }

    .review-date {
        display: block;
        margin-top: 2px;
        color: var(--muted);
        font-size: 11px;
    }

    .review-stars {
        margin-left: auto;
        color: #e9b719;
        font-size: 13px;
        letter-spacing: 1px;
    }

    .review-text {
        margin: 0;
        color: #555a52;
        font-size: 12.5px;
        line-height: 1.8;
    }

    /* ================= TOAST ================= */
    .pd-toast {
        position: fixed;
        left: 50%;
        bottom: 28px;
        transform: translateX(-50%) translateY(30px);
        padding: 14px 22px;
        border-radius: 10px;
        background: rgba(32,37,31,.94);
        color: #fff;
        font-size: 13px;
        font-weight: 700;
        box-shadow: 0 14px 34px rgba(0,0,0,.32);
        opacity: 0;
        pointer-events: none;
        transition: opacity .3s var(--ease), transform .35s var(--ease-bounce);
        z-index: 100;
        backdrop-filter: blur(6px);
    }

    .pd-toast.show {
        opacity: 1;
        transform: translateX(-50%) translateY(0);
    }

    /* ================= MODAL ================= */
    .pd-modal {
        position: fixed;
        inset: 0;
        display: none;
        align-items: center;
        justify-content: center;
        z-index: 200;
        padding: 20px;
    }

    .pd-modal.open {
        display: flex;
    }

    .pd-modal-backdrop {
        position: absolute;
        inset: 0;
        background: rgba(20,24,18,.55);
        backdrop-filter: blur(4px);
        animation: pdFadeIn .25s var(--ease);
    }

    .pd-modal-panel {
        position: relative;
        width: 100%;
        max-width: 560px;
        max-height: 88vh;
        overflow: auto;
        padding: 24px 26px;
        border-radius: 14px;
        background: #fff;
        box-shadow: 0 22px 60px rgba(0,0,0,.35);
        animation: pdModalIn .35s var(--ease-bounce);
        z-index: 1;
    }

    .pd-modal-head {
        display: flex;
        align-items: center;
        justify-content: space-between;
        gap: 12px;
        margin-bottom: 18px;
        padding-bottom: 14px;
        border-bottom: 1px solid var(--border);
    }

    .pd-modal-head h3 {
        margin: 0;
        color: var(--dark);
        font-size: 17px;
        font-weight: 900;
    }

    .pd-modal-close {
        width: 34px;
        height: 34px;
        display: grid;
        place-items: center;
        border: 0;
        border-radius: 50%;
        background: #f1f3ee;
        color: var(--dark);
        font-size: 14px;
        cursor: pointer;
        transition: background .25s var(--ease), transform .25s var(--ease-bounce);
    }

    .pd-modal-close:hover {
        background: #e2e6de;
        transform: rotate(90deg);
    }

    .pd-size-table {
        width: 100%;
        border-collapse: collapse;
        font-size: 12.5px;
    }

    .pd-size-table th,
    .pd-size-table td {
        padding: 11px 14px;
        text-align: left;
        border-bottom: 1px solid var(--border);
    }

    .pd-size-table thead th {
        background: #f4f7f2;
        color: var(--dark);
        font-weight: 800;
        font-size: 11.5px;
        text-transform: uppercase;
        letter-spacing: .5px;
    }

    .pd-size-table tbody tr:hover {
        background: #f8fcf9;
    }

    /* ================= RESPONSIVE ================= */
    @media (max-width: 1080px) {
        .pd-grid {
            grid-template-columns: 1fr;
            gap: 32px;
        }

        .pd-feature-list,
        .pd-reviews-grid {
            grid-template-columns: 1fr;
        }
    }

    @media (max-width: 720px) {
        .pd-specs-grid,
        .pd-care-list {
            grid-template-columns: 1fr;
        }

        .spec-row:nth-child(odd) {
            border-right: 0;
        }

        .spec-row:nth-last-child(-n+2) {
            border-bottom: 1px solid var(--border);
        }

        .spec-row:last-child {
            border-bottom: 0;
        }
    }

    @media (max-width: 640px) {
        .pd-page {
            padding: 18px 4% 40px;
        }

        .pd-gallery {
            grid-template-columns: 1fr;
            gap: 14px;
        }

        .pd-thumbs {
            flex-direction: row;
            order: 2;
            overflow-x: auto;
            padding-bottom: 4px;
            gap: 10px;
        }

        .pd-thumb {
            flex-shrink: 0;
            width: 72px;
            height: 72px;
        }

        .pd-main-image {
            order: 1;
        }

        .pd-actions {
            grid-template-columns: 1fr;
        }

        .pd-trust {
            grid-template-columns: 1fr;
            gap: 14px;
        }

        .pd-price {
            font-size: 26px;
        }

        .pd-old-price {
            font-size: 15px;
        }

        .pd-stock-tag {
            margin-left: 0;
        }

        .pd-tabs {
            gap: 0;
        }

        .pd-tab {
            padding: 10px 12px;
            font-size: 12.5px;
        }

        .pd-toast {
            left: 4%;
            right: 4%;
            transform: translateY(30px);
            text-align: center;
        }

        .pd-toast.show {
            transform: translateY(0);
        }
    }

    @media (prefers-reduced-motion: reduce) {
        .pd-page *,
        .pd-page *::before,
        .pd-page *::after {
            animation-duration: .01ms !important;
            animation-iteration-count: 1 !important;
            transition-duration: .01ms !important;
        }
    }
</style>

<script type="text/javascript">
    (function () {
        'use strict';

        var page = document.querySelector('.pd-page');
        if (!page) return;

        /* ============ THUMBNAILS ============ */
        var thumbs = page.querySelectorAll('.pd-thumb');
        var mainImage = document.getElementById('mainImage');
        var mainWrap = document.getElementById('mainImageWrap');

        thumbs.forEach(function (thumb) {
            thumb.addEventListener('click', function () {
                thumbs.forEach(function (t) { t.classList.remove('active'); });
                thumb.classList.add('active');

                var newSrc = thumb.getAttribute('data-img');
                if (newSrc && mainImage) {
                    mainImage.style.opacity = '0';
                    setTimeout(function () {
                        mainImage.src = newSrc;
                        mainImage.style.opacity = '1';
                    }, 150);
                }
                if (mainWrap) mainWrap.classList.remove('zoomed');
            });
        });

        /* ============ ZOOM ============ */
        if (mainWrap && mainImage) {
            mainImage.style.transition = 'transform .5s cubic-bezier(.4,0,.2,1), opacity .15s ease';

            mainWrap.addEventListener('click', function (e) {
                mainWrap.classList.toggle('zoomed');

                var rect = mainWrap.getBoundingClientRect();
                var x = ((e.clientX - rect.left) / rect.width) * 100;
                var y = ((e.clientY - rect.top) / rect.height) * 100;
                mainImage.style.transformOrigin = x + '% ' + y + '%';
            });
        }

        /* ============ WISHLIST ============ */
        var wish = document.getElementById('wishlistBtn');
        if (wish) {
            wish.addEventListener('click', function () {
                var selected = wish.classList.toggle('selected');
                wish.setAttribute('aria-pressed', selected ? 'true' : 'false');

                var icon = wish.querySelector('.heart-icon');
                if (icon) icon.textContent = selected ? '\u2665' : '\u2661';

                showToast(selected ? 'Added to wishlist' : 'Removed from wishlist');
            });
        }

        /* ============ COLOR SWATCHES ============ */
        var swatches = page.querySelectorAll('.color-swatch');
        var colorValue = document.getElementById('colorValue');
        swatches.forEach(function (sw) {
            sw.addEventListener('click', function () {
                swatches.forEach(function (s) { s.classList.remove('active'); });
                sw.classList.add('active');

                var color = sw.getAttribute('data-color');
                if (colorValue && color) colorValue.textContent = color;
                showToast('Color: ' + color);
            });
        });

        /* ============ SIZE CHIPS ============ */
        var sizes = page.querySelectorAll('.size-chip');
        sizes.forEach(function (chip) {
            chip.addEventListener('click', function () {
                sizes.forEach(function (s) { s.classList.remove('active'); });
                chip.classList.add('active');

                var size = chip.getAttribute('data-size');
                if (size) showToast('Size: ' + size);
            });
        });

        /* ============ QUANTITY ============ */
        var qty = document.getElementById('qtyInput');
        var minus = document.getElementById('qtyMinus');
        var plus = document.getElementById('qtyPlus');

        function clampQty(v) {
            v = parseInt(v, 10);
            if (isNaN(v)) v = 1;
            return Math.min(Math.max(v, 1), 99);
        }

        if (qty) {
            qty.addEventListener('change', function () { qty.value = clampQty(qty.value); });
            qty.addEventListener('blur', function () { qty.value = clampQty(qty.value); });
        }
        if (minus && qty) {
            minus.addEventListener('click', function () {
                qty.value = clampQty(parseInt(qty.value, 10) - 1);
            });
        }
        if (plus && qty) {
            plus.addEventListener('click', function () {
                qty.value = clampQty(parseInt(qty.value, 10) + 1);
            });
        }

        /* ============ CART / BUY ============ */
        var addBtn = document.getElementById('addToCartBtn');
        var buyBtn = document.getElementById('buyNowBtn');

        if (addBtn) {
            addBtn.addEventListener('click', function () {
                var n = qty ? qty.value : 1;
                showToast('Added ' + n + ' item(s) to cart');
            });
        }
        if (buyBtn) {
            buyBtn.addEventListener('click', function () {
                showToast('Redirecting to checkout...');
            });
        }

        /* ============ SECONDARY ============ */
        var shareBtn = document.getElementById('shareBtn');
        var compareBtn = document.getElementById('compareBtn');

        if (shareBtn) {
            shareBtn.addEventListener('click', function () { showToast('Share link copied'); });
        }
        if (compareBtn) {
            compareBtn.addEventListener('click', function () { showToast('Added to compare'); });
        }

        /* ============ DELIVERY CHECK ============ */
        var pinInput = document.getElementById('pinInput');
        var pinBtn = document.getElementById('checkPinBtn');
        var pinMsg = document.getElementById('pinMessage');

        if (pinBtn && pinInput && pinMsg) {
            pinBtn.addEventListener('click', function () {
                var val = pinInput.value.trim();
                pinMsg.className = 'pd-pin-message';

                if (!/^[0-9]{6}$/.test(val)) {
                    pinMsg.textContent = 'Please enter a valid 6-digit PIN code.';
                    pinMsg.classList.add('error');
                    return;
                }

                pinMsg.textContent = 'Delivery available — arrives in 4–6 days.';
            });
        }

        /* ============ TABS ============ */
        var tabs = page.querySelectorAll('.pd-tab');
        var panels = page.querySelectorAll('.pd-tab-panel');

        tabs.forEach(function (tab) {
            tab.addEventListener('click', function () {
                var target = tab.getAttribute('data-tab');

                tabs.forEach(function (t) {
                    t.classList.remove('active');
                    t.setAttribute('aria-selected', 'false');
                });
                tab.classList.add('active');
                tab.setAttribute('aria-selected', 'true');

                panels.forEach(function (panel) {
                    panel.classList.toggle('active', panel.getAttribute('data-panel') === target);
                });
            });
        });

        /* ============ SIZE GUIDE MODAL ============ */
        var sizeGuideBtn = document.getElementById('sizeGuideBtn');
        var sizeModal = document.getElementById('sizeModal');

        if (sizeGuideBtn && sizeModal) {
            sizeGuideBtn.addEventListener('click', function () {
                sizeModal.classList.add('open');
                document.body.style.overflow = 'hidden';
            });

            sizeModal.querySelectorAll('[data-close]').forEach(function (el) {
                el.addEventListener('click', function () {
                    sizeModal.classList.remove('open');
                    document.body.style.overflow = '';
                });
            });

            document.addEventListener('keydown', function (e) {
                if (e.key === 'Escape' && sizeModal.classList.contains('open')) {
                    sizeModal.classList.remove('open');
                    document.body.style.overflow = '';
                }
            });
        }

        /* ============ TOAST ============ */
        var toast = document.getElementById('pdToast');
        var toastTimer;

        function showToast(message) {
            if (!toast) return;
            toast.textContent = message;
            toast.classList.add('show');

            clearTimeout(toastTimer);
            toastTimer = setTimeout(function () {
                toast.classList.remove('show');
            }, 2200);
        }
    })();
</script>

</asp:Content>