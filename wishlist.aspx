<%@ Page Title="TEXTILES | My Wishlist"
    Language="C#"
    MasterPageFile="~/Site.Master"
    AutoEventWireup="true"
    CodeBehind="wishlist.aspx.cs"
    Inherits="SE_Project.wishlist" %>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="SE_Project" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

<style>
    .wishlist-page {
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

    .wishlist-page *,
    .wishlist-page *::before,
    .wishlist-page *::after {
        box-sizing: border-box;
    }

    .wishlist-page a {
        color: inherit;
        text-decoration: none;
    }

    .wishlist-page img {
        display: block;
        max-width: 100%;
    }

    .wl-container {
        width: 100%;
        max-width: 1400px;
        margin: 0 auto;
    }

    /* BREADCRUMB */
    .wl-breadcrumb {
        display: flex;
        align-items: center;
        gap: 8px;
        margin-bottom: 20px;
        color: var(--muted);
        font-size: 12px;
    }

    .wl-breadcrumb a:hover {
        color: var(--green);
    }

    .wl-breadcrumb span {
        color: var(--dark);
        font-weight: 700;
    }

    /* PAGE HEADER */
    .wl-header {
        display: flex;
        align-items: end;
        justify-content: space-between;
        gap: 20px;
        margin-bottom: 22px;
        flex-wrap: wrap;
    }

    .wl-header h1 {
        margin: 0 0 7px;
        font-size: 28px;
    }

    .wl-header p {
        margin: 0;
        color: var(--muted);
        font-size: 13px;
        line-height: 1.7;
    }

    .wl-header-actions {
        display: flex;
        align-items: center;
        gap: 10px;
        flex-wrap: wrap;
    }

    .wl-btn {
        display: inline-flex;
        align-items: center;
        justify-content: center;
        gap: 8px;
        padding: 11px 18px;
        border: 0;
        border-radius: 8px;
        background: var(--green);
        color: white !important;
        font-size: 13px;
        font-weight: 700;
        cursor: pointer;
        transition: .2s ease;
    }

    .wl-btn:hover {
        background: var(--green-dark);
        transform: translateY(-1px);
    }

    .wl-btn-ghost {
        background: white;
        color: #4b4f48 !important;
        border: 1px solid var(--border);
    }

    .wl-btn-ghost:hover {
        border-color: var(--green);
        color: var(--green) !important;
        background: white;
    }

    .wl-btn-sm {
        padding: 8px 14px;
        font-size: 12px;
    }

    /* TOOLBAR */
    .wl-toolbar {
        display: flex;
        align-items: center;
        justify-content: space-between;
        gap: 14px;
        margin-bottom: 20px;
        padding: 14px 18px;
        border: 1px solid var(--border);
        border-radius: 10px;
        background: white;
        flex-wrap: wrap;
    }

    .wl-count {
        color: var(--muted);
        font-size: 13px;
    }

    .wl-count strong {
        color: var(--dark);
    }

    /* PRODUCT GRID */
    .wl-grid {
        display: grid;
        grid-template-columns: repeat(4, minmax(0, 1fr));
        gap: 18px;
    }

    .wl-card {
        position: relative;
        min-width: 0;
        padding: 12px;
        border: 1px solid var(--border);
        border-radius: 12px;
        background: white;
        transition: transform .2s, box-shadow .2s;
        display: flex;
        flex-direction: column;
    }

    .wl-card:hover {
        transform: translateY(-4px);
        box-shadow: 0 9px 24px rgba(0,0,0,.08);
    }

    .wl-card.removing {
        opacity: .3;
        transform: scale(.95);
        pointer-events: none;
    }

    .wl-image {
        position: relative;
        aspect-ratio: 4 / 5;
        overflow: hidden;
        border-radius: 8px;
        background: #f1eeea;
    }

    .wl-image > a {
        display: block;
        width: 100%;
        height: 100%;
    }

    .wl-image img {
        width: 100%;
        height: 100%;
        object-fit: cover;
        transition: transform .35s ease;
    }

    .wl-card:hover .wl-image img {
        transform: scale(1.04);
    }

    .wl-badge {
        position: absolute;
        top: 8px;
        left: 8px;
        padding: 4px 8px;
        border-radius: 4px;
        background: var(--green);
        color: white;
        font-size: 10px;
        font-weight: 700;
        letter-spacing: .5px;
        text-transform: uppercase;
    }

    .wl-badge.out {
        background: #888;
    }

    .wl-remove {
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
        color: #77766f;
        font-size: 18px;
        cursor: pointer;
        box-shadow: 0 2px 6px rgba(0,0,0,.15);
        transition: .15s;
    }

    .wl-remove:hover {
        background: #fff0f3;
        color: #d93050;
    }

    .wl-body {
        display: flex;
        flex-direction: column;
        flex: 1;
        padding-top: 12px;
    }

    .wl-cat {
        font-size: 11px;
        color: var(--muted);
        text-transform: uppercase;
        letter-spacing: .5px;
        margin-bottom: 4px;
    }

    .wl-name {
        font-size: 13px;
        font-weight: 700;
        color: var(--dark);
        margin-bottom: 8px;
        line-height: 1.4;
    }

    .wl-name:hover {
        color: var(--green);
    }

    .wl-pricing {
        display: flex;
        align-items: baseline;
        gap: 8px;
        margin-bottom: 14px;
    }

    .wl-price {
        color: var(--green);
        font-size: 16px;
        font-weight: 800;
    }

    .wl-old {
        color: #92918c;
        font-size: 12px;
        text-decoration: line-through;
    }

    .wl-actions {
        margin-top: auto;
        display: flex;
        gap: 8px;
    }

        .wl-size-wrapper {
        margin: 6px 0 10px;
    }
    .wl-size-hint {
        display: flex;
        justify-content: space-between;
        font-size: 11px;
        color: var(--muted);
        margin-bottom: 4px;
    }
    .wl-size-hint strong { color: var(--dark); }
    .wl-size-list { display: flex; gap: 4px; flex-wrap: wrap; }
    .wl-size-chip {
        padding: 2px 6px;
        min-width: 24px;
        height: 22px;
        font-size: 10.5px;
        font-weight: 600;
        border-radius: 4px;
        border: 1px solid #d1d5db;
        background: #fff;
        color: #374151;
        cursor: pointer;
        display: inline-flex;
        align-items: center;
        justify-content: center;
        transition: all .15s ease;
    }
    .wl-size-chip:hover:not(:disabled) { border-color: var(--green); color: var(--green); }
    .wl-size-chip.active { background: var(--green); border-color: var(--green); color: #fff; }
    .wl-size-chip:disabled, .wl-size-chip.disabled {
        background: #f3f4f6; border-color: #e5e7eb; color: #9ca3af; text-decoration: line-through; cursor: not-allowed; opacity: .6;
    }

    .wl-actions .wl-btn {
        flex: 1;
        padding: 9px 12px;
        font-size: 12px;
    }

    /* EMPTY STATE */
    .wl-empty {
        padding: 60px 20px;
        text-align: center;
        border: 2px dashed var(--border);
        border-radius: 12px;
        background: white;
    }

    .wl-empty-icon {
        font-size: 48px;
        color: #d93050;
        margin-bottom: 16px;
    }

    .wl-empty h2 {
        margin: 0 0 8px;
        font-size: 22px;
    }

    .wl-empty p {
        max-width: 440px;
        margin: 0 auto 24px;
        color: var(--muted);
        line-height: 1.7;
    }

    /* RESPONSIVE */
    @media (max-width: 1100px) {
        .wl-grid {
            grid-template-columns: repeat(3, minmax(0, 1fr));
        }
    }

    @media (max-width: 768px) {
        .wl-grid {
            grid-template-columns: repeat(2, minmax(0, 1fr));
            gap: 12px;
        }

        .wishlist-page {
            padding: 16px 4%;
        }

        .wl-header h1 {
            font-size: 24px;
        }
    }

    @media (max-width: 480px) {
        .wl-grid {
            grid-template-columns: 1fr;
        }
    }
</style>

<div class="wishlist-page">
    <div class="wl-container">

        <!-- BREADCRUMB -->
        <nav class="wl-breadcrumb" aria-label="Breadcrumb">
            <a href="index.aspx">Home</a>
            <span>/</span>
            <span>My Wishlist</span>
        </nav>

        <!-- PAGE HEADER -->
        <div class="wl-header">
            <div>
                <h1>My Wishlist</h1>
                <p>Saved styles and collections ready for your wardrobe.</p>
            </div>

            <% if (WishlistCount > 0) { %>
            <div class="wl-header-actions">
                <button type="button" class="wl-btn wl-btn-sm" id="wlMoveAllBtn">Move All to Cart</button>
                <button type="button" class="wl-btn wl-btn-ghost wl-btn-sm" id="wlClearAllBtn">Clear Wishlist</button>
            </div>
            <% } %>
        </div>

        <% if (WishlistCount == 0) { %>
            <!-- EMPTY STATE -->
            <div class="wl-empty">
                <div class="wl-empty-icon">&#9825;</div>
                <h2>Your Wishlist is Empty</h2>
                <p>Save items you love by clicking the heart icon on any product card while browsing our collection.</p>
                <a href="products.aspx" class="wl-btn">Explore Menswear Collection &#8594;</a>
            </div>
        <% } else { %>
            <!-- TOOLBAR -->
            <div class="wl-toolbar">
                <div class="wl-count">
                    Showing <strong><%= WishlistCount %></strong> saved items
                </div>
                <div style="font-size:12px; color:var(--muted);">
                    Items remain saved across your visits
                </div>
            </div>

            <!-- PRODUCT GRID -->
            <div class="wl-grid" id="wlGrid">
                <% 
                foreach (DataRow r in WishlistTable.Rows)
                {
                    int wid = Convert.ToInt32(r["WishlistId"]);
                    int pid = Convert.ToInt32(r["ProductId"]);
                    string name = r["Name"].ToString();
                    string img = r["ImageUrl"] != DBNull.Value && !string.IsNullOrWhiteSpace(r["ImageUrl"].ToString()) 
                        ? r["ImageUrl"].ToString() 
                        : "images/tshirt.png";
                    string cat = r["CategoryName"] != DBNull.Value ? r["CategoryName"].ToString() : "Menswear";
                    decimal price = Convert.ToDecimal(r["Price"]);
                    decimal? oldPrice = r["OldPrice"] != DBNull.Value ? (decimal?)Convert.ToDecimal(r["OldPrice"]) : null;
                    int stock = Convert.ToInt32(r["Stock"]);
                    int stockS = r.Table.Columns.Contains("StockS") && r["StockS"] != DBNull.Value ? Convert.ToInt32(r["StockS"]) : 0;
                    int stockM = r.Table.Columns.Contains("StockM") && r["StockM"] != DBNull.Value ? Convert.ToInt32(r["StockM"]) : 0;
                    int stockL = r.Table.Columns.Contains("StockL") && r["StockL"] != DBNull.Value ? Convert.ToInt32(r["StockL"]) : 0;
                    int stockXL = r.Table.Columns.Contains("StockXL") && r["StockXL"] != DBNull.Value ? Convert.ToInt32(r["StockXL"]) : 0;
                    int stockXXL = r.Table.Columns.Contains("StockXXL") && r["StockXXL"] != DBNull.Value ? Convert.ToInt32(r["StockXXL"]) : 0;

                    string initialSize = "";
                    if (stockS > 0) initialSize = "S";
                    else if (stockM > 0) initialSize = "M";
                    else if (stockL > 0) initialSize = "L";
                    else if (stockXL > 0) initialSize = "XL";
                    else if (stockXXL > 0) initialSize = "XXL";
                    else initialSize = "None";
                %>
                <div class="wl-card" id="wlCard_<%= wid %>" data-wid="<%= wid %>" data-pid="<%= pid %>" data-selected-size="<%= initialSize %>">
                    <div class="wl-image">
                        <a href="product-details.aspx?id=<%= pid %>">
                            <img src="<%= ResolveUrl("~/" + img) %>" alt="<%= Server.HtmlEncode(name) %>" />
                        </a>
                        <span class="wl-badge <%= stock > 0 ? "" : "out" %>"><%= stock > 0 ? "In Stock" : "Sold Out" %></span>
                        <button type="button" class="wl-remove" title="Remove from wishlist" data-wid="<%= wid %>">&times;</button>
                    </div>

                    <div class="wl-body">
                        <span class="wl-cat"><%= Server.HtmlEncode(cat) %></span>
                        <a href="product-details.aspx?id=<%= pid %>" class="wl-name"><%= Server.HtmlEncode(name) %></a>

                        <div class="wl-pricing">
                            <span class="wl-price">&#8377; <%= price.ToString("N0") %></span>
                            <% if (oldPrice.HasValue && oldPrice.Value > price) { %>
                                <span class="wl-old">&#8377; <%= oldPrice.Value.ToString("N0") %></span>
                            <% } %>
                        </div>

                                                <div class="wl-size-wrapper">
                            <div class="wl-size-hint">
                                <span>Size:</span>
                                <strong id="wl-size-val-<%= wid %>"><%= initialSize == "None" ? "Out of Stock" : initialSize %></strong>
                            </div>
                            <div class="wl-size-list" id="wl-sizes-<%= wid %>">
                                <button type="button" class="wl-size-chip <%= initialSize == "S" ? "active" : "" %> <%= stockS <= 0 ? "disabled" : "" %>" <%= stockS <= 0 ? "disabled" : "" %> onclick="onSelectWishlistSize(event, <%= wid %>, 'S', <%= stockS %>)">S</button>
                                <button type="button" class="wl-size-chip <%= initialSize == "M" ? "active" : "" %> <%= stockM <= 0 ? "disabled" : "" %>" <%= stockM <= 0 ? "disabled" : "" %> onclick="onSelectWishlistSize(event, <%= wid %>, 'M', <%= stockM %>)">M</button>
                                <button type="button" class="wl-size-chip <%= initialSize == "L" ? "active" : "" %> <%= stockL <= 0 ? "disabled" : "" %>" <%= stockL <= 0 ? "disabled" : "" %> onclick="onSelectWishlistSize(event, <%= wid %>, 'L', <%= stockL %>)">L</button>
                                <button type="button" class="wl-size-chip <%= initialSize == "XL" ? "active" : "" %> <%= stockXL <= 0 ? "disabled" : "" %>" <%= stockXL <= 0 ? "disabled" : "" %> onclick="onSelectWishlistSize(event, <%= wid %>, 'XL', <%= stockXL %>)">XL</button>
                                <button type="button" class="wl-size-chip <%= initialSize == "XXL" ? "active" : "" %> <%= stockXXL <= 0 ? "disabled" : "" %>" <%= stockXXL <= 0 ? "disabled" : "" %> onclick="onSelectWishlistSize(event, <%= wid %>, 'XXL', <%= stockXXL %>)">XXL</button>
                            </div>
                        </div>

                        <div class="wl-actions">
                            <button type="button" class="wl-btn wl-move-btn" data-wid="<%= wid %>" data-pid="<%= pid %>" <%= stock <= 0 ? "disabled" : "" %>>
                                <%= stock > 0 ? "Move to Cart" : "Out of Stock" %>
                            </button>
                        </div>
                    </div>
                </div>
                <% } %>
            </div>
        <% } %>

    </div>
</div>

<script type="text/javascript">
(function() {
    var root = document.querySelector(".wishlist-page");
    if (!root) return;

    // Single item remove
    root.querySelectorAll(".wl-remove").forEach(function(btn) {
        btn.addEventListener("click", function() {
            var wid = btn.getAttribute("data-wid");
            var card = root.querySelector("#wlCard_" + wid);
            if (card) card.classList.add("removing");

            fetch("Api.ashx?action=remove_wishlist&wishlistId=" + wid, { credentials: "same-origin" })
                .then(function(r) { return r.json(); })
                .then(function(res) {
                    if (res.success) {
                        if (card) card.remove();
                        if (window.updateSiteBadges) window.updateSiteBadges();
                        // check if grid is empty
                        var remaining = root.querySelectorAll(".wl-card");
                        if (remaining.length === 0) {
                            window.location.reload();
                        }
                    } else {
                        if (card) card.classList.remove("removing");
                        alert(res.message || "Failed to remove item.");
                    }
                })
                .catch(function() {
                    if (card) card.classList.remove("removing");
                });
        });
    });

    window.onSelectWishlistSize = function(e, wid, size, stock) {
        if (e) { e.preventDefault(); e.stopPropagation(); }
        if (stock <= 0) return;
        var card = document.getElementById('wlCard_' + wid);
        if (!card) return;
        card.setAttribute('data-selected-size', size);
        var val = document.getElementById('wl-size-val-' + wid);
        if (val) val.textContent = size + (stock <= 5 ? ' (' + stock + ' left)' : '');
        var chips = card.querySelectorAll('.wl-size-chip');
        chips.forEach(function(c) {
            if (c.textContent.trim() === size) c.classList.add('active');
            else c.classList.remove('active');
        });
    };

    // Move single item to cart
    root.querySelectorAll(".wl-move-btn").forEach(function(btn) {
        btn.addEventListener("click", function() {
            var wid = btn.getAttribute("data-wid");
            var pid = btn.getAttribute("data-pid");
            btn.disabled = true;
            btn.textContent = "Moving...";

                        var card = root.querySelector("#wlCard_" + wid);
            var size = card ? card.getAttribute("data-selected-size") : "M";
            if (!size || size === "None") {
                alert("Please select an available size before moving to cart.");
                btn.disabled = false;
                btn.textContent = "Move to Cart";
                return;
            }
            fetch("Api.ashx?action=move_wishlist_to_cart&wishlistId=" + wid + "&productId=" + pid + "&size=" + encodeURIComponent(size), { credentials: "same-origin" })
                .then(function(r) { return r.json(); })
                .then(function(res) {
                    if (res.success) {
                        var card = root.querySelector("#wlCard_" + wid);
                        if (card) card.remove();
                        if (window.updateSiteBadges) window.updateSiteBadges();
                        alert("Item moved to your cart!");
                        var remaining = root.querySelectorAll(".wl-card");
                        if (remaining.length === 0) {
                            window.location.reload();
                        }
                    } else {
                        btn.disabled = false;
                        btn.textContent = "Move to Cart";
                        alert(res.message || "Failed to move item.");
                    }
                })
                .catch(function() {
                    btn.disabled = false;
                    btn.textContent = "Move to Cart";
                });
        });
    });

    // Move all to cart
    var moveAllBtn = root.querySelector("#wlMoveAllBtn");
    if (moveAllBtn) {
        moveAllBtn.addEventListener("click", function() {
            if (!confirm("Move all wishlist items to your cart?")) return;
            moveAllBtn.disabled = true;
            moveAllBtn.textContent = "Moving all...";

            fetch("Api.ashx?action=move_all_wishlist_to_cart", { credentials: "same-origin" })
                .then(function(r) { return r.json(); })
                .then(function(res) {
                    if (res.success) {
                        if (window.updateSiteBadges) window.updateSiteBadges();
                        alert(res.message || "All items moved to your shopping cart!");
                        window.location.href = "cart.aspx";
                    } else {
                        moveAllBtn.disabled = false;
                        moveAllBtn.textContent = "Move All to Cart";
                        alert(res.message || "Failed to move items.");
                    }
                })
                .catch(function() {
                    moveAllBtn.disabled = false;
                    moveAllBtn.textContent = "Move All to Cart";
                });
        });
    }

    // Clear all
    var clearAllBtn = root.querySelector("#wlClearAllBtn");
    if (clearAllBtn) {
        clearAllBtn.addEventListener("click", function() {
            if (!confirm("Are you sure you want to clear your entire wishlist?")) return;
            clearAllBtn.disabled = true;

            fetch("Api.ashx?action=clear_wishlist", { credentials: "same-origin" })
                .then(function(r) { return r.json(); })
                .then(function(res) {
                    if (res.success) {
                        if (window.updateSiteBadges) window.updateSiteBadges();
                        window.location.reload();
                    } else {
                        clearAllBtn.disabled = false;
                        alert(res.message || "Failed to clear wishlist.");
                    }
                })
                .catch(function() {
                    clearAllBtn.disabled = false;
                });
        });
    }

})();
</script>

</asp:Content>