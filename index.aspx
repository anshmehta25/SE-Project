
<%@ Page Title="TEXTILES | Premium Men's Clothing"
    Language="C#"
    MasterPageFile="~/Site.Master"
    AutoEventWireup="true"
    CodeBehind="index.aspx.cs"
    Inherits="SE_Project.WebForm1" %>

<asp:Content ID="Content1"
    ContentPlaceHolderID="MainContent"
    runat="server">

<style>
    .textiles-home {
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

    .textiles-home *,
    .textiles-home *::before,
    .textiles-home *::after {
        box-sizing: border-box;
    }

    .textiles-home a {
        color: inherit;
        text-decoration: none;
    }

    .textiles-home img {
        display: block;
        max-width: 100%;
    }

    .th-container {
        width: 100%;
        max-width: 1400px;
        margin: 0 auto;
    }

    /* HERO */
    .th-hero {
        display: flex;
        align-items: center;
        min-height: 430px;
        padding: 45px 6%;
        overflow: hidden;
        border-radius: 13px;
        color: white;
        background-image:
            linear-gradient(
                90deg,
                rgba(0,0,0,.76) 0%,
                rgba(0,0,0,.48) 48%,
                rgba(0,0,0,.08) 100%
            ),
            url('<%= ResolveUrl("~/Images/hero7.png") %>');
        background-size: cover;
        background-position: center;
        background-repeat: no-repeat;
    }

    .th-hero-copy {
        max-width: 560px;
    }

    .th-label {
        display: inline-block;
        margin-bottom: 16px;
        padding: 7px 12px;
        border-radius: 4px;
        background: var(--green);
        color: white;
        font-size: 11px;
        font-weight: 700;
        letter-spacing: 2px;
    }

    .th-hero h1 {
        margin: 0 0 17px;
        color: white;
        font-size: clamp(32px, 4vw, 52px);
        line-height: 1.15;
        font-weight: 800;
    }

    .th-hero p {
        max-width: 460px;
        margin: 0 0 25px;
        color: #f2f2f2;
        font-size: 15px;
        line-height: 1.8;
    }

    .th-btn {
        display: inline-flex;
        align-items: center;
        justify-content: center;
        gap: 8px;
        padding: 13px 21px;
        border: 0;
        border-radius: 6px;
        background: white;
        color: var(--green) !important;
        font-size: 13px;
        font-weight: 700;
        cursor: pointer;
        transition: .2s ease;
    }

    .th-btn:hover {
        transform: translateY(-2px);
        background: #eaf3e8;
    }

    .th-btn-green {
        background: var(--green);
        color: white !important;
    }

    .th-btn-green:hover {
        background: var(--green-dark);
        color: white !important;
    }

    /* BENEFITS */
    .th-benefits {
        display: grid;
        grid-template-columns: repeat(4, minmax(0, 1fr));
        gap: 17px;
        margin-top: 22px;
        padding: 20px;
        border: 1px solid var(--border);
        border-radius: 10px;
        background: white;
    }

    .th-benefit {
        display: flex;
        align-items: center;
        gap: 10px;
    }

    .th-benefit-icon {
        display: grid;
        place-items: center;
        flex-shrink: 0;
        width: 40px;
        height: 40px;
        border-radius: 9px;
        background: #eaf3e8;
        color: var(--green);
        font-size: 19px;
    }

    .th-benefit strong {
        display: block;
        font-size: 13px;
    }

    .th-benefit p {
        margin: 5px 0 0;
        color: var(--muted);
        font-size: 11px;
        line-height: 1.5;
    }

    /* SECTION HEADINGS */
    .th-section {
        margin-top: 38px;
        scroll-margin-top: 20px;
    }

    .th-heading {
        display: flex;
        align-items: end;
        justify-content: space-between;
        gap: 12px;
        margin-bottom: 18px;
    }

    .th-heading h2 {
        margin: 0 0 7px;
        font-size: 25px;
    }

    .th-heading p {
        margin: 0;
        color: var(--muted);
        font-size: 13px;
        line-height: 1.7;
    }

    .th-view {
        color: var(--green) !important;
        font-weight: 700;
        text-decoration: underline !important;
        white-space: nowrap;
    }

    /* CATEGORIES */
    .th-category-grid {
        display: grid;
        grid-template-columns: repeat(6, minmax(0, 1fr));
        gap: 15px;
    }

    .th-category-card {
        display: flex;
        flex-direction: column;
        min-width: 0;
        overflow: hidden;
        border: 1px solid var(--border);
        border-radius: 10px;
        background: white;
        transition: transform .2s, box-shadow .2s;
    }

    .th-category-card:hover {
        transform: translateY(-4px);
        box-shadow: 0 8px 20px rgba(0,0,0,.08);
    }

    .th-category-card img {
        width: 100%;
        aspect-ratio: 4 / 4.5;
        object-fit: cover;
        background: #f0eeea;
    }

    .th-category-info {
        padding: 12px 7px;
        text-align: center;
    }

    .th-category-info strong {
        display: block;
        font-size: 13px;
    }

    .th-category-info small {
        display: block;
        margin-top: 5px;
        color: var(--muted);
        font-size: 10px;
    }

    /* NEW ARRIVALS */
    .th-products {
        display: grid;
        grid-template-columns: repeat(4, minmax(0, 1fr));
        gap: 14px;
    }

    .th-card {
        min-width: 0;
        padding: 9px;
        border: 1px solid var(--border);
        border-radius: 10px;
        background: white;
        transition: transform .2s, box-shadow .2s;
    }

    .th-card:hover {
        transform: translateY(-4px);
        box-shadow: 0 9px 24px rgba(0,0,0,.08);
    }

    .th-image {
        position: relative;
        aspect-ratio: 4 / 5;
        overflow: hidden;
        border-radius: 7px;
        background: #f1eeea;
    }

    .th-image > a {
        display: block;
        width: 100%;
        height: 100%;
    }

    .th-image img {
        width: 100%;
        height: 100%;
        object-fit: cover;
        transition: transform .35s ease;
    }

    .th-card:hover .th-image img {
        transform: scale(1.05);
    }

    .th-heart {
        position: absolute;
        top: 8px;
        right: 8px;
        display: grid;
        place-items: center;
        width: 32px;
        height: 32px;
        border: 0;
        border-radius: 50%;
        background: white;
        color: #30352f;
        font-size: 21px;
        cursor: pointer;
        box-shadow: 0 2px 7px rgba(0,0,0,.08);
    }

    .th-heart.selected {
        color: #d93050;
    }

    .th-name {
        display: block;
        margin-top: 12px;
        overflow: hidden;
        font-size: 12px;
        font-weight: 700;
        text-overflow: ellipsis;
        white-space: nowrap;
    }

    .th-type {
        margin-top: 6px;
        color: var(--muted);
        font-size: 11px;
    }

    .th-meta {
        display: flex;
        align-items: center;
        justify-content: space-between;
        gap: 5px;
        margin-top: 9px;
    }

    .th-price {
        color: var(--green);
        font-size: 12px;
        font-weight: 700;
        white-space: nowrap;
    }

    .th-old {
        margin-left: 3px;
        color: #92918c;
        font-size: 10px;
        font-weight: 400;
        text-decoration: line-through;
    }

    .th-rating {
        color: #65655e;
        font-size: 11px;
        white-space: nowrap;
    }

    .th-rating span {
        color: #e9b719;
    }

    .th-empty {
        display: none;
        grid-column: 1 / -1;
        padding: 25px;
        border: 1px solid var(--border);
        border-radius: 8px;
        background: white;
        color: var(--muted);
        text-align: center;
    }

    /* SHOP BY STYLE */
    .th-style-grid {
        display: grid;
        grid-template-columns: repeat(4, minmax(0, 1fr));
        gap: 15px;
    }

    .th-style-card {
        display: flex;
        flex-direction: column;
        padding: 20px;
        border: 1px solid var(--border);
        border-radius: 10px;
        background: white;
        transition: .2s;
    }

    .th-style-card:hover {
        border-color: var(--green);
        transform: translateY(-3px);
    }

    .th-style-icon {
        display: grid;
        place-items: center;
        width: 46px;
        height: 46px;
        margin-bottom: 14px;
        border-radius: 10px;
        background: #eaf3e8;
        color: var(--green);
        font-size: 22px;
    }

    .th-style-card h3 {
        margin: 0 0 9px;
        font-size: 15px;
    }

    .th-style-card p {
        flex: 1;
        margin: 0 0 15px;
        color: var(--muted);
        font-size: 12px;
        line-height: 1.8;
    }

    .th-style-link {
        color: var(--green) !important;
        font-size: 12px;
        font-weight: 700;
    }

    /* ABOUT */
    .th-about {
        display: grid;
        grid-template-columns: 1.5fr 1fr;
        gap: 30px;
        align-items: center;
        padding: 30px;
        border: 1px solid var(--border);
        border-radius: 12px;
        background: white;
    }

    .th-about-label {
        display: inline-block;
        margin-bottom: 12px;
        color: var(--green);
        font-size: 11px;
        font-weight: 700;
        letter-spacing: 2px;
        text-transform: uppercase;
    }

    .th-about h2 {
        margin: 0 0 15px;
        font-size: 28px;
        line-height: 1.3;
    }

    .th-about-copy p {
        color: var(--muted);
        font-size: 13px;
        line-height: 1.9;
    }

    .th-about-copy .th-btn {
        margin-top: 8px;
    }

    .th-about-list {
        display: grid;
        gap: 12px;
    }

    .th-about-item {
        padding: 14px;
        border: 1px solid var(--border);
        border-radius: 8px;
        background: #fcfbf9;
    }

    .th-about-item strong,
    .th-about-item span {
        display: block;
    }

    .th-about-item strong {
        margin-bottom: 6px;
        font-size: 13px;
    }

    .th-about-item span {
        color: var(--muted);
        font-size: 12px;
    }

    /* PROMOTION */
    .th-promo {
        display: flex;
        align-items: center;
        justify-content: space-between;
        gap: 20px;
        margin-top: 38px;
        padding: 28px 30px;
        border-radius: 12px;
        background: #eaf3e8;
    }

    .th-promo h2 {
        margin: 0 0 9px;
        font-size: 24px;
    }

    .th-promo p {
        margin: 0;
        color: #62685f;
        font-size: 13px;
        line-height: 1.8;
    }

    /* NEWSLETTER */
    .th-newsletter {
        margin-top: 38px;
        padding: 35px 20px;
        border: 1px solid var(--border);
        border-radius: 12px;
        background: white;
        text-align: center;
    }

    .th-newsletter h2 {
        margin: 0 0 10px;
        font-size: 24px;
    }

    .th-newsletter > p {
        margin: 0 0 20px;
        color: var(--muted);
        font-size: 13px;
        line-height: 1.7;
    }

    .th-newsletter-form {
        display: flex;
        gap: 8px;
        width: 100%;
        max-width: 480px;
        margin: 0 auto;
    }

    .th-newsletter-form input {
        flex: 1;
        min-width: 0;
        height: 44px;
        padding: 0 13px;
        border: 1px solid #d5ddd3;
        border-radius: 6px;
        outline: none;
        font-size: 13px;
    }

    .th-newsletter-form input:focus {
        border-color: var(--green);
    }

    .th-newsletter-form button {
        padding: 0 18px;
        border: 0;
        border-radius: 6px;
        background: var(--green);
        color: white;
        font-size: 13px;
        font-weight: 700;
        cursor: pointer;
    }

    .th-newsletter-form button:hover {
        background: var(--green-dark);
    }

    .th-message {
        display: block;
        margin-top: 12px;
        color: var(--green);
        font-size: 12px;
    }

    /* RESPONSIVE */
    @media (max-width: 1150px) {
        .th-category-grid {
            grid-template-columns: repeat(3, minmax(0, 1fr));
        }

        .th-benefits {
            grid-template-columns: repeat(2, minmax(0, 1fr));
        }

        .th-products {
            grid-template-columns: repeat(4, minmax(0, 1fr));
        }
    }

    @media (max-width: 760px) {
        .textiles-home {
            padding: 16px 4%;
        }

        .th-hero {
            min-height: 360px;
            padding: 32px 7%;
            background-position: center;
        }

        .th-hero h1 {
            font-size: 34px;
        }

        .th-category-grid {
            grid-template-columns: repeat(2, minmax(0, 1fr));
            gap: 12px;
        }

        .th-products {
            grid-template-columns: repeat(2, minmax(0, 1fr));
            gap: 10px;
        }

        .th-style-grid {
            grid-template-columns: repeat(2, minmax(0, 1fr));
        }

        .th-about {
            grid-template-columns: 1fr;
            padding: 20px;
        }

        .th-about h2 {
            font-size: 24px;
        }

        .th-promo {
            align-items: flex-start;
            flex-direction: column;
            padding: 23px;
        }
    }

    @media (max-width: 480px) {
        .th-hero {
            min-height: 330px;
            padding: 25px 6%;
        }

        .th-hero h1 {
            font-size: 29px;
        }

        .th-hero p {
            font-size: 13px;
        }

        .th-benefits {
            grid-template-columns: 1fr;
            padding: 15px;
        }

        .th-heading h2 {
            font-size: 21px;
        }

        .th-heading p {
            font-size: 12px;
        }

        .th-style-grid {
            grid-template-columns: 1fr;
        }

        .th-newsletter-form {
            flex-direction: column;
        }

        .th-newsletter-form button {
            min-height: 42px;
        }
    }
</style>

<div class="textiles-home">
    <div class="th-container">

        <!-- HERO -->
        <section class="th-hero">
            <div class="th-hero-copy">
                <span class="th-label">PREMIUM MENSWEAR</span>

                <h1>
                    Discover Your Style.
                    Wear Your Confidence.
                </h1>

                <p>
                    Explore men's clothing designed for everyday comfort,
                    modern style and timeless appeal. Find your next
                    favourite outfit at TEXTILES.
                </p>

                <a href="products.aspx" class="th-btn">
                    Shop Collection &#8594;
                </a>
            </div>
        </section>

        <!-- BENEFITS -->
        <section class="th-benefits">
            <div class="th-benefit">
                <span class="th-benefit-icon">&#10003;</span>
                <div>
                    <strong>Quality First</strong>
                    <p>Comfort-focused clothing</p>
                </div>
            </div>

            <div class="th-benefit">
                <span class="th-benefit-icon">&#9733;</span>
                <div>
                    <strong>Modern Designs</strong>
                    <p>Styles for every occasion</p>
                </div>
            </div>

            <div class="th-benefit">
                <span class="th-benefit-icon">&#128666;</span>
                <div>
                    <strong>Easy Shopping</strong>
                    <p>Simple product browsing</p>
                </div>
            </div>

            <div class="th-benefit">
                <span class="th-benefit-icon">&#9829;</span>
                <div>
                    <strong>Everyday Comfort</strong>
                    <p>Made for your lifestyle</p>
                </div>
            </div>
        </section>

        <!-- CATEGORIES -->
        <section class="th-section" id="categories">
            <div class="th-heading">
                <div>
                    <h2>Shop by Category</h2>
                    <p>Find your style from our men's clothing collections.</p>
                </div>

                <a class="th-view" href="products.aspx">
                    View All &#8594;
                </a>
            </div>

            <div class="th-category-grid">
                <a class="th-category-card" href="category.aspx?cat=tshirts">
                    <img src="<%= ResolveUrl("~/Images/category-tshirt.jpg") %>"
                         alt="Men's T-shirts" />
                    <div class="th-category-info">
                        <strong>T-Shirts</strong>
                        <small>Everyday essentials</small>
                    </div>
                </a>

                <a class="th-category-card" href="category.aspx?cat=shirts">
                    <img src="<%= ResolveUrl("~/Images/category-shirt.jpg") %>"
                         alt="Men's shirts" />
                    <div class="th-category-info">
                        <strong>Shirts</strong>
                        <small>Smart and casual</small>
                    </div>
                </a>

                <a class="th-category-card" href="category.aspx?cat=jeans">
                    <img src="<%= ResolveUrl("~/Images/category-jeans.jpg") %>"
                         alt="Men's jeans" />
                    <div class="th-category-info">
                        <strong>Jeans</strong>
                        <small>Classic denim</small>
                    </div>
                </a>

                <a class="th-category-card" href="category.aspx?cat=jackets">
                    <img src="<%= ResolveUrl("~/Images/category-jacket.jpg") %>"
                         alt="Men's jackets" />
                    <div class="th-category-info">
                        <strong>Jackets</strong>
                        <small>Layer your style</small>
                    </div>
                </a>

                <a class="th-category-card" href="category.aspx?cat=hoodies">
                    <img src="<%= ResolveUrl("~/Images/product-hoodie.jpg") %>"
                         alt="Men's hoodies" />
                    <div class="th-category-info">
                        <strong>Hoodies</strong>
                        <small>Comfort and warmth</small>
                    </div>
                </a>

                <a class="th-category-card" href="products.aspx">
                    <img src="<%= ResolveUrl("~/Images/product-linen.jpg") %>"
                         alt="All clothing products" />
                    <div class="th-category-info">
                        <strong>All Products</strong>
                        <small>Explore the collection</small>
                    </div>
                </a>
            </div>
        </section>

        <!-- NEW ARRIVALS -->
        <section class="th-section" id="new-arrivals">
            <div class="th-heading">
                <div>
                    <h2>New Arrivals</h2>
                    <p>Discover the latest styles curated for your wardrobe.</p>
                </div>

                <a class="th-view" href="products.aspx">
                    View All &#8594;
                </a>
            </div>

            <div class="th-products" id="thProducts">

                <article class="th-card" data-name="essential sage tee t-shirt">
                    <div class="th-image">
                        <a href="product-details.aspx?id=1">
                            <img src="<%= ResolveUrl("~/Images/product-tee.jpg") %>"
                                 alt="Essential Sage Tee" />
                        </a>

                        <button type="button"
                                class="th-heart"
                                aria-label="Add Essential Sage Tee to wishlist"
                                aria-pressed="false">&#9825;</button>
                    </div>

                    <a class="th-name" href="product-details.aspx?id=1">
                        Essential Sage Tee
                    </a>
                    <div class="th-type">Men's T-Shirt</div>

                    <div class="th-meta">
                        <span class="th-price">
                            &#8377; 999
                            <span class="th-old">&#8377; 1,299</span>
                        </span>
                        <span class="th-rating"><span>&#9733;</span> 4.8</span>
                    </div>
                </article>

                <article class="th-card" data-name="cloudsoft hoodie sweatshirt">
                    <div class="th-image">
                        <a href="product-details.aspx?id=2">
                            <img src="<%= ResolveUrl("~/Images/product-hoodie.jpg") %>"
                                 alt="CloudSoft Hoodie" />
                        </a>

                        <button type="button"
                                class="th-heart"
                                aria-label="Add CloudSoft Hoodie to wishlist"
                                aria-pressed="false">&#9825;</button>
                    </div>

                    <a class="th-name" href="product-details.aspx?id=2">
                        CloudSoft Hoodie
                    </a>
                    <div class="th-type">Men's Hoodie</div>

                    <div class="th-meta">
                        <span class="th-price">
                            &#8377; 1,499
                            <span class="th-old">&#8377; 1,899</span>
                        </span>
                        <span class="th-rating"><span>&#9733;</span> 4.9</span>
                    </div>
                </article>

                <article class="th-card" data-name="linen utility overshirt linen shirt">
                    <div class="th-image">
                        <a href="product-details.aspx?id=3">
                            <img src="<%= ResolveUrl("~/Images/product-linen.jpg") %>"
                                 alt="Linen Utility Overshirt" />
                        </a>

                        <button type="button"
                                class="th-heart"
                                aria-label="Add Linen Utility Overshirt to wishlist"
                                aria-pressed="false">&#9825;</button>
                    </div>

                    <a class="th-name" href="product-details.aspx?id=3">
                        Linen Utility Overshirt
                    </a>
                    <div class="th-type">Men's Shirt</div>

                    <div class="th-meta">
                        <span class="th-price">
                            &#8377; 1,799
                            <span class="th-old">&#8377; 2,199</span>
                        </span>
                        <span class="th-rating"><span>&#9733;</span> 4.7</span>
                    </div>
                </article>

                <article class="th-card" data-name="classic everyday shirt">
                    <div class="th-image">
                        <a href="product-details.aspx?id=4">
                            <img src="<%= ResolveUrl("~/Images/category-shirt.jpg") %>"
                                 alt="Classic Everyday Shirt" />
                        </a>

                        <button type="button"
                                class="th-heart"
                                aria-label="Add Classic Everyday Shirt to wishlist"
                                aria-pressed="false">&#9825;</button>
                    </div>

                    <a class="th-name" href="product-details.aspx?id=4">
                        Classic Everyday Shirt
                    </a>
                    <div class="th-type">Men's Shirt</div>

                    <div class="th-meta">
                        <span class="th-price">
                            &#8377; 1,299
                            <span class="th-old">&#8377; 1,599</span>
                        </span>
                        <span class="th-rating"><span>&#9733;</span> 4.5</span>
                    </div>
                </article>

                <div class="th-empty" id="thEmpty">
                    No matching products found. Try another search.
                </div>
            </div>
        </section>

        <!-- SHOP BY STYLE -->
        <section class="th-section" id="shop-by-style">
            <div class="th-heading">
                <div>
                    <h2>Find Your Everyday Style</h2>
                    <p>Clothing for relaxed days and smart occasions.</p>
                </div>
            </div>

            <div class="th-style-grid">
                <article class="th-style-card">
                    <span class="th-style-icon">&#10022;</span>
                    <h3>Everyday Essentials</h3>
                    <p>Comfortable T-shirts and versatile basics for everyday wear.</p>
                    <a class="th-style-link" href="category.aspx?cat=tshirts">
                        Explore T-Shirts &#8594;
                    </a>
                </article>

                <article class="th-style-card">
                    <span class="th-style-icon">&#10003;</span>
                    <h3>Smart Casual</h3>
                    <p>Shirts and versatile pieces for a clean, confident look.</p>
                    <a class="th-style-link" href="category.aspx?cat=shirts">
                        Explore Shirts &#8594;
                    </a>
                </article>

                <article class="th-style-card">
                    <span class="th-style-icon">&#9830;</span>
                    <h3>Weekend Wear</h3>
                    <p>Relaxed outfits that balance personal style and everyday comfort.</p>
                    <a class="th-style-link" href="category.aspx?cat=jeans">
                        Explore Jeans &#8594;
                    </a>
                </article>

                <article class="th-style-card">
                    <span class="th-style-icon">&#10052;</span>
                    <h3>Winter Collection</h3>
                    <p>Hoodies and jackets for comfortable layering on cooler days.</p>
                    <a class="th-style-link" href="category.aspx?cat=jackets">
                        Explore Outerwear &#8594;
                    </a>
                </article>
            </div>
        </section>

        <!-- ABOUT TEXTILES -->
        <section class="th-section th-about" id="about-textiles">
            <div class="th-about-copy">
                <span class="th-about-label">Our Philosophy</span>

                <h2>Style That Feels Good. Quality That Matters.</h2>

                <p>
                    At TEXTILES, we believe great clothing should be
                    comfortable, versatile and easy to wear. Our collection
                    brings together everyday essentials and modern menswear
                    styles to help you build a wardrobe that suits you.
                </p>

                <p>
                    Discover T-shirts, shirts, jeans and hoodies for different
                    occasions and personal styles.
                </p>

                <a href="products.aspx" class="th-btn th-btn-green">
                    Discover Our Collection &#8594;
                </a>
            </div>

            <div class="th-about-list">
                <div class="th-about-item">
                    <strong>&#10003; Everyday Comfort</strong>
                    <span>Versatile styles for daily wear.</span>
                </div>

                <div class="th-about-item">
                    <strong>&#10003; Timeless Style</strong>
                    <span>Pieces for different occasions.</span>
                </div>

                <div class="th-about-item">
                    <strong>&#10003; Easy to Explore</strong>
                    <span>Browse by category and collection.</span>
                </div>

                <div class="th-about-item">
                    <strong>&#10003; Personal Style</strong>
                    <span>Discover clothing that suits you.</span>
                </div>
            </div>
        </section>

        <!-- PROMOTION -->
        <section class="th-promo" id="offers">
            <div>
                <h2>Refresh Your Wardrobe</h2>
                <p>
                    Explore timeless styles and everyday essentials.<br />
                    <strong>Discover prices and offers on selected products.</strong>
                </p>
            </div>

            <a href="products.aspx" class="th-btn th-btn-green">
                Explore Collection &#8594;
            </a>
        </section>

        <!-- NEWSLETTER -->
        <section class="th-newsletter">
            <h2>Join the TEXTILES Community</h2>

            <p>
                Stay updated on new arrivals, collections and special offers.
            </p>

            <div class="th-newsletter-form">
                <input type="email"
                       id="thEmail"
                       placeholder="Enter your email address"
                       aria-label="Email address" />

                <button type="button" id="thSubscribeBtn">
                    Subscribe
                </button>
            </div>

            <span class="th-message"
                  id="thMessage"
                  aria-live="polite"></span>
        </section>

    </div>
</div>

<script type="text/javascript">
    (function () {
        var root = document.querySelector(".textiles-home");

        if (!root) {
            return;
        }

        /* Wishlist visual demo */
        root.querySelectorAll(".th-heart").forEach(function (button) {
            button.addEventListener("click", function () {
                var selected = button.classList.toggle("selected");

                button.setAttribute(
                    "aria-pressed",
                    selected ? "true" : "false"
                );

                button.textContent = selected ? "\u2665" : "\u2661";
            });
        });

        /* Newsletter validation demo */
        var subscribe = root.querySelector("#thSubscribeBtn");
        var email = root.querySelector("#thEmail");
        var message = root.querySelector("#thMessage");

        if (subscribe && email && message) {
            subscribe.addEventListener("click", function () {
                var value = email.value.trim();
                var valid = /^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(value);

                if (!valid) {
                    message.textContent =
                        "Please enter a valid email address.";
                    email.focus();
                    return;
                }

                message.textContent =
                    "Thank you! Your email is valid. " +
                    "Connect a backend to save your subscription.";
            });

            email.addEventListener("keydown", function (event) {
                if (event.key === "Enter") {
                    event.preventDefault();
                    subscribe.click();
                }
            });
        }
    })();
</script>

</asp:Content>
