<%@ Page Title="TEXTILES | Shop by Category" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="category.aspx.cs" Inherits="SE_Project.category" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

<div class="categories-page">

    <!-- ================= PAGE HEADER ================= -->
    <div class="category-hero">
        <div class="category-hero-copy">
            <span class="category-eyebrow">SHOP BY CATEGORY</span>
            <h1>Explore Categories</h1>
            <p>
                Choose a textile family curated precisely for comfort and style.
                From everyday essentials to seasonal layers — find your fit.
            </p>
        </div>

        <div class="category-hero-stats">
            <div class="cat-stat">
                <strong><%= CategoriesTable != null ? CategoriesTable.Rows.Count : 5 %></strong>
                <span>Categories</span>
            </div>
            <div class="cat-stat">
                <strong>500+</strong>
                <span>Styles</span>
            </div>
            <div class="cat-stat">
                <strong>4.8&#9733;</strong>
                <span>Rated</span>
            </div>
        </div>
    </div>

    <!-- ================= FILTER BAR ================= -->
    <div class="category-toolbar">
        <div class="category-toolbar-left">
            <span class="toolbar-label">Showing all categories</span>
        </div>
        <div class="category-toolbar-right">
            <button type="button" class="toolbar-chip active">All</button>
            <button type="button" class="toolbar-chip">Tops</button>
            <button type="button" class="toolbar-chip">Bottoms</button>
            <button type="button" class="toolbar-chip">Outerwear</button>
        </div>
    </div>

    <!-- ================= CATEGORY GRID ================= -->
    <div class="category-grid">
        <% if (CategoriesTable != null && CategoriesTable.Rows.Count > 0) {
            foreach (System.Data.DataRow cat in CategoriesTable.Rows) {
                string cName = cat.Table.Columns.Contains("Name") && cat["Name"] != DBNull.Value 
                    ? cat["Name"].ToString() 
                    : (cat.Table.Columns.Contains("CategoryName") && cat["CategoryName"] != DBNull.Value ? cat["CategoryName"].ToString() : "Category");
                string cSlug = cat.Table.Columns.Contains("Slug") && cat["Slug"] != DBNull.Value 
                    ? cat["Slug"].ToString() 
                    : (cat.Table.Columns.Contains("CategorySlug") && cat["CategorySlug"] != DBNull.Value ? cat["CategorySlug"].ToString() : "all");
                string cDesc = cat["Description"] != DBNull.Value ? cat["Description"].ToString() : "Collection";
                string cImg = cat["ImageUrl"] != DBNull.Value && !string.IsNullOrWhiteSpace(cat["ImageUrl"].ToString())
                    ? cat["ImageUrl"].ToString()
                    : "images/tshirt.png";
                if (!cImg.StartsWith("http") && !cImg.StartsWith("/")) cImg = "~/" + cImg;
        %>
            <a href="<%= ResolveUrl("~/products.aspx?cat=" + cSlug) %>" class="category-card th-reveal" data-tags="all">
                <div class="category-media">
                    <img src="<%= ResolveUrl(cImg) %>" alt="<%: cName %>" />
                    <span class="category-shine"></span>
                </div>

                <div class="category-info">
                    <div class="category-title-row">
                        <h3><%: cName %></h3>
                        <span class="category-count">Explore</span>
                    </div>

                    <p><%: cDesc %></p>

                    <span class="category-cta">
                        View Products
                        <span class="cta-arrow">&#8594;</span>
                    </span>
                </div>
            </a>
        <%  }
        } %>
    </div>

    <!-- ================= BOTTOM PROMO ================= -->
    <section class="category-promo th-reveal">
        <div>
            <h2>Can't decide? Start with bestsellers.</h2>
            <p>
                Explore our most-loved pieces — handpicked by thousands of customers.
            </p>
        </div>

        <a href="products.aspx" class="category-promo-btn">
            Shop Bestsellers &#8594;
        </a>
    </section>

</div>

<style>
    /* ================= ANIMATIONS ================= */
    @keyframes catFadeUp {
        from { opacity: 0; transform: translateY(24px); }
        to   { opacity: 1; transform: translateY(0); }
    }

    @keyframes catFadeIn {
        from { opacity: 0; }
        to   { opacity: 1; }
    }

    @keyframes catFloat {
        0%, 100% { transform: translateY(0); }
        50%      { transform: translateY(-6px); }
    }

    @keyframes catShimmer {
        0%   { background-position: -300px 0; }
        100% { background-position: 300px 0; }
    }

    @keyframes catShine {
        0%   { transform: translateX(-120%) skewX(-20deg); opacity: 0; }
        35%  { opacity: .55; }
        100% { transform: translateX(220%) skewX(-20deg); opacity: 0; }
    }

    @keyframes catDropIn {
        0%   { opacity: 0; transform: translateY(-14px) scale(.9); }
        100% { opacity: 1; transform: translateY(0) scale(1); }
    }

    @keyframes catPulse {
        0%, 100% { transform: scale(1); opacity: 1; }
        50%      { transform: scale(1.1); opacity: .8; }
    }

    /* ================= BASE ================= */
    .categories-page {
        width: 100%;
        max-width: 100%;
        margin: 0;
        padding: 26px 5.5% 40px;
        box-sizing: border-box;
        background:
            radial-gradient(900px 400px at 100% 0%, rgba(8,120,60,.05), transparent 60%),
            #fcf9f7;
        font-family: Arial, sans-serif;
        color: #176b3a;
        overflow-x: hidden;
    }

    .categories-page *,
    .categories-page *::before,
    .categories-page *::after {
        box-sizing: border-box;
    }

    /* ================= HERO ================= */
    .category-hero {
        display: flex;
        align-items: flex-end;
        justify-content: space-between;
        gap: 24px;
        flex-wrap: wrap;
        margin: 0 0 22px;
        padding: 26px 28px;
        border: 1px solid #e9e5e1;
        border-radius: 14px;
        background:
            radial-gradient(500px 240px at 100% 0%, rgba(8,120,60,.08), transparent 70%),
            #fff;
        animation: catFadeUp .7s cubic-bezier(.4,0,.2,1) both;
        box-shadow: 0 2px 10px rgba(0,0,0,.03);
        position: relative;
        overflow: hidden;
    }

    .category-hero::after {
        content: '';
        position: absolute;
        top: -40%;
        right: -8%;
        width: 240px;
        height: 240px;
        border-radius: 50%;
        background: radial-gradient(circle, rgba(8,120,60,.10), transparent 70%);
        animation: catFloat 6s ease-in-out infinite;
        pointer-events: none;
    }

    .category-hero-copy {
        max-width: 640px;
        position: relative;
        z-index: 1;
    }

    .category-eyebrow {
        display: inline-block;
        margin-bottom: 10px;
        padding: 6px 12px;
        border-radius: 4px;
        background: linear-gradient(135deg, #08783c, #0a9e4f);
        color: #fff;
        font-size: 10.5px;
        font-weight: 800;
        letter-spacing: 2px;
        box-shadow: 0 4px 12px rgba(8,120,60,.35);
        animation: catDropIn .6s cubic-bezier(.34,1.56,.64,1) both;
    }

    .category-hero h1 {
        margin: 0 0 8px;
        color: #08753b;
        font-size: clamp(24px, 3vw, 34px);
        font-weight: 800;
        line-height: 1.2;
    }

    .category-hero h1::after {
        content: '';
        display: block;
        width: 54px;
        height: 3px;
        margin-top: 10px;
        border-radius: 3px;
        background: linear-gradient(90deg, #08783c, #c9a227);
    }

    .category-hero p {
        margin: 12px 0 0;
        color: #777;
        font-size: 13px;
        line-height: 1.8;
    }

    .category-hero-stats {
        display: flex;
        gap: 22px;
        position: relative;
        z-index: 1;
        animation: catFadeUp .8s .1s cubic-bezier(.4,0,.2,1) both;
    }

    .cat-stat {
        text-align: center;
        padding: 10px 4px;
    }

    .cat-stat strong {
        display: block;
        color: #08753b;
        font-size: 22px;
        font-weight: 800;
    }

    .cat-stat span {
        display: block;
        margin-top: 2px;
        color: #777;
        font-size: 10.5px;
        letter-spacing: 1px;
        text-transform: uppercase;
    }

    /* ================= TOOLBAR ================= */
    .category-toolbar {
        display: flex;
        align-items: center;
        justify-content: space-between;
        gap: 14px;
        flex-wrap: wrap;
        margin: 0 0 20px;
        padding: 12px 4px;
        border-bottom: 1px solid #e9e5e1;
        animation: catFadeIn .6s .15s cubic-bezier(.4,0,.2,1) both;
    }

    .toolbar-label {
        color: #777;
        font-size: 12px;
        font-weight: 600;
    }

    .category-toolbar-right {
        display: flex;
        gap: 7px;
        flex-wrap: wrap;
    }

    .toolbar-chip {
        padding: 7px 14px;
        border: 1px solid #e9e5e1;
        border-radius: 20px;
        background: #fff;
        color: #555;
        font-size: 11.5px;
        font-weight: 700;
        cursor: pointer;
        transition: all .25s cubic-bezier(.4,0,.2,1);
    }

    .toolbar-chip:hover {
        border-color: #08783c;
        color: #08783c;
        transform: translateY(-2px);
        box-shadow: 0 4px 10px rgba(8,120,60,.15);
    }

    .toolbar-chip.active {
        background: linear-gradient(135deg, #08783c, #0a9e4f);
        border-color: #08783c;
        color: #fff;
        box-shadow: 0 4px 12px rgba(8,120,60,.3);
    }

    /* ================= CATEGORY GRID ================= */
    .category-grid {
        display: grid;
        grid-template-columns: repeat(4, minmax(0, 1fr));
        gap: 18px;
        width: 100%;
    }

    .category-card {
        position: relative;
        display: block;
        width: 100%;
        height: 420px;
        min-width: 0;
        overflow: hidden;
        border-radius: 12px;
        background: linear-gradient(160deg, #b9bdbb, #a2a7a5);
        color: #fff;
        text-decoration: none;
        isolation: isolate;
        transition: transform .35s cubic-bezier(.4,0,.2,1),
                    box-shadow .35s cubic-bezier(.4,0,.2,1);
    }

    .category-card:hover {
        transform: translateY(-7px);
        box-shadow: 0 16px 34px rgba(0,0,0,.18);
    }

    /* Reveal animation for cards */
    .category-card.th-reveal {
        opacity: 0;
        transform: translateY(28px);
        transition: opacity .7s cubic-bezier(.4,0,.2,1),
                    transform .7s cubic-bezier(.4,0,.2,1),
                    box-shadow .35s cubic-bezier(.4,0,.2,1);
    }

    .category-card.th-reveal.th-visible {
        opacity: 1;
        transform: translateY(0);
    }

    .category-card.th-reveal.th-visible:hover {
        transform: translateY(-7px);
    }

    /* Badge */
    .category-badge {
        position: absolute;
        top: 12px;
        left: 12px;
        z-index: 4;
        padding: 6px 11px;
        border-radius: 4px;
        background: linear-gradient(135deg, #08783c, #0a9e4f);
        color: #fff;
        font-size: 9.5px;
        font-weight: 800;
        letter-spacing: 1.2px;
        text-transform: uppercase;
        box-shadow: 0 4px 12px rgba(8,120,60,.4);
        animation: catDropIn .5s cubic-bezier(.34,1.56,.64,1) both;
    }

    .category-badge-gold {
        background: linear-gradient(135deg, #c9a227, #e2b93b);
        box-shadow: 0 4px 12px rgba(201,162,39,.45);
    }

    /* Media wrapper */
    .category-media {
        position: relative;
        width: 100%;
        height: 100%;
        overflow: hidden;
    }

    .category-media img {
        display: block;
        width: 100%;
        height: 100%;
        object-fit: contain;
        object-position: center;
        padding: 18px 12px 110px;
        transition: transform .6s cubic-bezier(.4,0,.2,1),
                    filter .6s cubic-bezier(.4,0,.2,1);
        filter: drop-shadow(0 8px 18px rgba(0,0,0,.15));
    }

    .category-card:hover .category-media img {
        transform: scale(1.08) translateY(-4px);
        filter: drop-shadow(0 14px 26px rgba(0,0,0,.22));
    }

    /* Shine sweep */
    .category-shine {
        position: absolute;
        top: 0;
        left: 0;
        width: 60%;
        height: 100%;
        background: linear-gradient(
            100deg,
            transparent 20%,
            rgba(255,255,255,.45) 50%,
            transparent 80%
        );
        transform: translateX(-120%) skewX(-20deg);
        pointer-events: none;
        z-index: 3;
    }

    .category-card:hover .category-shine {
        animation: catShine 1s cubic-bezier(.4,0,.2,1) forwards;
    }

    /* Info panel */
    .category-info {
        position: absolute;
        left: 0;
        right: 0;
        bottom: 0;
        z-index: 2;
        padding: 60px 16px 16px;
        background: linear-gradient(
            to bottom,
            transparent,
            rgba(0,0,0,.55) 40%,
            rgba(0,0,0,.78)
        );
        color: #fff;
        transition: padding .35s cubic-bezier(.4,0,.2,1);
    }

    .category-card:hover .category-info {
        padding-bottom: 20px;
    }

    .category-title-row {
        display: flex;
        align-items: center;
        justify-content: space-between;
        gap: 8px;
        margin-bottom: 6px;
    }

    .category-info h3 {
        margin: 0;
        font-size: 18px;
        font-weight: 800;
        letter-spacing: .2px;
        position: relative;
        padding-bottom: 6px;
    }

    .category-info h3::after {
        content: '';
        position: absolute;
        left: 0;
        bottom: 0;
        width: 24px;
        height: 2px;
        border-radius: 2px;
        background: linear-gradient(90deg, #fff, #c9a227);
        transition: width .35s cubic-bezier(.4,0,.2,1);
    }

    .category-card:hover .category-info h3::after {
        width: 46px;
    }

    .category-count {
        flex-shrink: 0;
        padding: 3px 8px;
        border-radius: 10px;
        background: rgba(255,255,255,.18);
        border: 1px solid rgba(255,255,255,.28);
        font-size: 10px;
        font-weight: 700;
        letter-spacing: .5px;
        backdrop-filter: blur(4px);
    }

    .category-info p {
        margin: 8px 0 12px;
        color: #eaeaea;
        font-size: 11.5px;
        line-height: 1.5;
    }

    .category-cta {
        display: inline-flex;
        align-items: center;
        gap: 7px;
        padding: 8px 14px;
        border-radius: 6px;
        background: #fff;
        color: #08753b;
        font-size: 11px;
        font-weight: 800;
        letter-spacing: .4px;
        transition: transform .3s cubic-bezier(.34,1.56,.64,1),
                    background .3s cubic-bezier(.4,0,.2,1),
                    color .3s cubic-bezier(.4,0,.2,1),
                    box-shadow .3s cubic-bezier(.4,0,.2,1);
    }

    .category-cta .cta-arrow {
        display: inline-block;
        transition: transform .3s cubic-bezier(.34,1.56,.64,1);
    }

    .category-card:hover .category-cta {
        transform: translateY(-2px);
        background: #08783c;
        color: #fff;
        box-shadow: 0 8px 18px rgba(8,120,60,.5);
    }

    .category-card:hover .category-cta .cta-arrow {
        transform: translateX(4px);
    }

    /* ================= PROMO ================= */
    .category-promo {
        position: relative;
        display: flex;
        align-items: center;
        justify-content: space-between;
        gap: 20px;
        flex-wrap: wrap;
        margin-top: 34px;
        padding: 28px 30px;
        border-radius: 14px;
        background:
            radial-gradient(600px 240px at 0% 100%, rgba(201,162,39,.18), transparent 70%),
            linear-gradient(135deg, #eaf3e8, #dcefda);
        overflow: hidden;
        animation: catFadeUp .8s .2s cubic-bezier(.4,0,.2,1) both;
    }

    .category-promo::after {
        content: '';
        position: absolute;
        top: -40%;
        right: -8%;
        width: 260px;
        height: 260px;
        border-radius: 50%;
        background: radial-gradient(circle, rgba(8,120,60,.15), transparent 70%);
        animation: catFloat 6s ease-in-out infinite;
        pointer-events: none;
    }

    .category-promo h2 {
        margin: 0 0 8px;
        color: #20251f;
        font-size: 22px;
        font-weight: 800;
    }

    .category-promo p {
        margin: 0;
        color: #5f665c;
        font-size: 13px;
        line-height: 1.7;
        max-width: 480px;
    }

    .category-promo-btn {
        position: relative;
        z-index: 1;
        display: inline-flex;
        align-items: center;
        gap: 8px;
        padding: 13px 22px;
        border-radius: 7px;
        background: linear-gradient(135deg, #08783c, #0a9e4f);
        color: #fff !important;
        font-size: 13px;
        font-weight: 800;
        text-decoration: none;
        box-shadow: 0 6px 18px rgba(8,120,60,.32);
        transition: transform .3s cubic-bezier(.4,0,.2,1),
                    box-shadow .3s cubic-bezier(.4,0,.2,1),
                    background .3s cubic-bezier(.4,0,.2,1);
    }

    .category-promo-btn:hover {
        transform: translateY(-3px);
        background: linear-gradient(135deg, #075c2e, #08783c);
        box-shadow: 0 12px 26px rgba(8,120,60,.45);
    }

    /* ================= RESPONSIVE ================= */
    @media (max-width: 1100px) {
        .category-grid {
            grid-template-columns: repeat(3, minmax(0, 1fr));
        }
    }

    @media (max-width: 900px) {
        .category-grid {
            grid-template-columns: repeat(2, minmax(0, 1fr));
        }

        .category-card {
            height: 340px;
        }

        .category-hero {
            padding: 22px;
        }

        .category-hero-stats {
            gap: 16px;
        }

        .cat-stat strong {
            font-size: 19px;
        }
    }

    @media (max-width: 640px) {
        .category-hero {
            flex-direction: column;
            align-items: flex-start;
        }

        .category-hero-stats {
            width: 100%;
            justify-content: space-between;
        }

        .category-toolbar {
            padding: 10px 0;
        }
    }

    @media (max-width: 500px) {
        .categories-page {
            padding: 18px 12px 30px;
        }

        .category-grid {
            grid-template-columns: repeat(2, minmax(0, 1fr));
            gap: 12px;
        }

        .category-card {
            height: 250px;
        }

        .category-info {
            padding: 40px 10px 11px;
        }

        .category-info h3 {
            font-size: 14px;
        }

        .category-info p {
            font-size: 10px;
        }

        .category-count {
            font-size: 9px;
            padding: 2px 6px;
        }

        .category-cta {
            padding: 6px 10px;
            font-size: 10px;
        }

        .category-media img {
            padding: 12px 8px 80px;
        }

        .category-badge {
            font-size: 8.5px;
            padding: 5px 8px;
        }

        .category-promo {
            padding: 22px;
        }

        .category-promo h2 {
            font-size: 19px;
        }
    }

    @media (prefers-reduced-motion: reduce) {
        .categories-page *,
        .categories-page *::before,
        .categories-page *::after {
            animation-duration: .01ms !important;
            animation-iteration-count: 1 !important;
            transition-duration: .01ms !important;
        }
        .category-card.th-reveal {
            opacity: 1;
            transform: none;
        }
    }
</style>

<script type="text/javascript">
(function() {
    'use strict';

    var root = document.querySelector('.categories-page');
    if (!root) return;

    /* ---- Reveal on scroll ---- */
    var revealEls = root.querySelectorAll('.th-reveal');
    if ('IntersectionObserver' in window && revealEls.length) {
        var io = new IntersectionObserver(function(entries) {
            entries.forEach(function(entry) {
                if (entry.isIntersecting) {
                    entry.target.classList.add('th-visible');
                    io.unobserve(entry.target);
                }
            });
        }, { threshold: 0.12 });

        revealEls.forEach(function(el) { io.observe(el); });
    } else {
        revealEls.forEach(function(el) { el.classList.add('th-visible'); });
    }

    /* ---- Toolbar chip filter (demo) ---- */
    var chips = root.querySelectorAll('.toolbar-chip');
    var cards = root.querySelectorAll('.category-card');

    chips.forEach(function(chip) {
        chip.addEventListener('click', function() {
            chips.forEach(function(c) { c.classList.remove('active'); });
            chip.classList.add('active');

            var label = chip.textContent.trim().toLowerCase();
            var map = {
                'all': null,
                'tops': 'tops',
                'bottoms': 'bottoms',
                'outerwear': 'outerwear'
            };
            var tag = map[label];

            cards.forEach(function(card) {
                var tags = (card.getAttribute('data-tags') || '').toLowerCase();
                var match = !tag || tags.indexOf(tag) !== -1;

                card.style.transition = 'opacity .3s ease, transform .3s ease';

                if (match) {
                    card.style.display = '';
                    requestAnimationFrame(function() {
                        card.style.opacity = '1';
                        card.style.transform = 'translateY(0)';
                    });
                } else {
                    card.style.opacity = '0';
                    card.style.transform = 'translateY(10px)';
                    setTimeout(function() {
                        if (card.style.opacity === '0') {
                            card.style.display = 'none';
                        }
                    }, 280);
                }
            });
        });
    });

    /* ---- Card click micro-interaction ---- */
    cards.forEach(function(card) {
        card.addEventListener('mousedown', function() {
            card.style.transition = 'transform .12s ease';
            card.style.transform = 'translateY(-3px) scale(.995)';
        });
        card.addEventListener('mouseup', function() {
            card.style.transform = '';
        });
        card.addEventListener('mouseleave', function() {
            card.style.transform = '';
        });
    });
    })();
</script>

</asp:Content>