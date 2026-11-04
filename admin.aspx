<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="admin.aspx.cs" Inherits="SE_Project.adminaspx" %>

<!DOCTYPE html>
<html lang="en">
<head runat="server">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Textiles Admin — Store Management</title>

    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link href="https://fonts.googleapis.com/css2?family=Plus+Jakarta+Sans:wght@400;500;600;700;800&family=Inter:wght@400;500;600;700&display=swap" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css" />

    <style>
        :root {
            --green-dark: #0b3d2e;
            --green-accent: #10b981;
            --green-soft: #d1fae5;
            --green-light: #ecfdf5;
            --main-bg: #f6f8f9;
            --card-bg: #ffffff;
            --text-main: #0f172a;
            --text-muted: #64748b;
            --text-light: #94a3b8;
            --border-light: #e5e9ec;
            --sidebar-text: #a7c2b8;
            --radius-card: 12px;
            --shadow-card: 0 1px 3px rgba(15, 23, 42, 0.04), 0 1px 2px rgba(15, 23, 42, 0.02);
            --shadow-hover: 0 10px 25px -5px rgba(15, 23, 42, 0.08), 0 8px 10px -6px rgba(15, 23, 42, 0.01);
            --danger: #ef4444;
            --warn: #f59e0b;
            --info: #3b82f6;
        }

        [data-theme="dark"] {
            --main-bg: #0f1720;
            --card-bg: #1a2432;
            --text-main: #e2e8f0;
            --text-muted: #94a3b8;
            --text-light: #64748b;
            --border-light: #2d3748;
        }
        [data-theme="dark"] .stat-card,
        [data-theme="dark"] .panel,
        [data-theme="dark"] .product-card,
        [data-theme="dark"] .stock-card { background: var(--card-bg); }
        [data-theme="dark"] .topbar { background: var(--card-bg); }
        [data-theme="dark"] .data-table th { background: #0f1720; }
        [data-theme="dark"] .data-table td { border-color: var(--border-light); }
        [data-theme="dark"] .data-table tr:hover td { background: #1e2a3a; }
        [data-theme="dark"] .toolbar { background: #0f1720; }
        [data-theme="dark"] .form-input { background: #0f1720; color: var(--text-main); border-color: var(--border-light); }
        [data-theme="dark"] .chart-container { background: #0f1720; }
        [data-theme="dark"] .donut::after { background: #0f1720; }
        [data-theme="dark"] .topbar-search input { background: #0f1720; }
        [data-theme="dark"] .topbar-clock,
        [data-theme="dark"] .topbar-bell,
        [data-theme="dark"] .topbar-profile { background: #0f1720; }
        [data-theme="dark"] .search-dropdown,
        [data-theme="dark"] .profile-dropdown { background: #1a2432; }
        [data-theme="dark"] .activity-item { border-color: var(--border-light); }
        [data-theme="dark"] .live-feed-item { background: #0f1720; }
        [data-theme="dark"] .progress-ring .bg { stroke: #2d3748; }

        * { box-sizing: border-box; margin: 0; padding: 0; }

        ::-webkit-scrollbar { width: 6px; height: 6px; }
        ::-webkit-scrollbar-track { background: transparent; }
        ::-webkit-scrollbar-thumb { background: #cbd5e1; border-radius: 10px; }
        ::-webkit-scrollbar-thumb:hover { background: #94a3b8; }

        body {
            font-family: 'Plus Jakarta Sans', 'Inter', -apple-system, sans-serif;
            background: var(--main-bg);
            color: var(--text-main);
            min-height: 100vh;
            -webkit-font-smoothing: antialiased;
            font-size: 14px;
            transition: background .2s;
        }

        a { text-decoration: none; color: inherit; }

        .admin-layout { display: flex; min-height: 100vh; }

        /* ================= SIDEBAR ================= */
        .admin-sidebar {
            width: 264px;
            background: linear-gradient(180deg, #0b3d2e 0%, #082e22 100%);
            display: flex; flex-direction: column;
            position: fixed; left: 0; top: 0; bottom: 0;
            z-index: 1000; overflow-y: auto; overflow-x: visible;
            transition: width .3s cubic-bezier(.4,0,.2,1), transform .25s ease;
            box-shadow: 4px 0 24px rgba(0,0,0,.08);
        }
        .admin-sidebar::-webkit-scrollbar { width: 4px; }
        .admin-sidebar::-webkit-scrollbar-thumb { background: rgba(255,255,255,0.1); }

        .admin-sidebar.collapsed { width: 76px; }
        .admin-sidebar.collapsed .sb-brand-text,
        .admin-sidebar.collapsed .sb-item span,
        .admin-sidebar.collapsed .sb-badge,
        .admin-sidebar.collapsed .sb-tag,
        .admin-sidebar.collapsed .sb-section-head span,
        .admin-sidebar.collapsed .sb-user-meta,
        .admin-sidebar.collapsed .sb-section-chevron,
        .admin-sidebar.collapsed .sb-footer span,
        .admin-sidebar.collapsed .sb-user-card > i,
        .admin-sidebar.collapsed .live-dot { display: none; }
        .admin-sidebar.collapsed .sb-item { justify-content: center; padding: 12px 0; }
        .admin-sidebar.collapsed .sb-section-head { justify-content: center; }
        .admin-sidebar.collapsed .sb-user-card { justify-content: center; padding: 10px 0; }
        .admin-sidebar.collapsed .sb-footer a { justify-content: center; padding: 10px 0; }

        .admin-main {
            margin-left: 264px; flex: 1; display: flex; flex-direction: column;
            min-height: 100vh;
            transition: margin-left .3s cubic-bezier(.4,0,.2,1);
        }
        .admin-main.sidebar-collapsed { margin-left: 76px; }

        .sb-brand { padding: 22px 20px 18px; display: flex; align-items: center; gap: 12px; }
        .sb-brand-logo {
            width: 34px; height: 34px; background: var(--green-accent);
            border-radius: 10px; display: grid; place-items: center;
            color: #fff; font-weight: 800; font-size: 18px;
            position: relative; flex-shrink: 0;
            animation: brandPulse 3s ease-in-out infinite;
        }
        @keyframes brandPulse {
            0%, 100% { box-shadow: 0 4px 10px rgba(16,185,129,.3); }
            50% { box-shadow: 0 4px 22px rgba(16,185,129,.65); }
        }
        .sb-brand-logo::after {
            content: ''; position: absolute; inset: -3px;
            border-radius: 12px; border: 1.5px solid rgba(16,185,129,.45);
            animation: brandRing 3s ease-in-out infinite;
        }
        @keyframes brandRing {
            0%, 100% { transform: scale(1); opacity: .5; }
            50% { transform: scale(1.15); opacity: 0; }
        }
        .sb-brand-text { font-size: 16px; font-weight: 700; color: #fff; letter-spacing: -0.3px; }

        .sb-collapse-btn {
            position: absolute; top: 22px; right: 12px;
            width: 24px; height: 24px; border-radius: 6px;
            background: rgba(255,255,255,.08); border: none;
            color: #fff; cursor: pointer; display: grid; place-items: center;
            font-size: 10px; transition: background .2s, transform .3s;
            z-index: 5;
        }
        .sb-collapse-btn:hover { background: var(--green-accent); }
        .admin-sidebar.collapsed .sb-collapse-btn { transform: rotate(180deg); }

        .sb-menu { list-style: none; padding: 6px 12px 20px; flex: 1; display: flex; flex-direction: column; gap: 2px; }

        .sb-section { overflow: visible; }
        .sb-section-head {
            display: flex; align-items: center; gap: 10px;
            padding: 9px 14px; margin: 12px 8px 2px;
            font-size: 10.5px; font-weight: 800; letter-spacing: 1.2px;
            text-transform: uppercase; color: rgba(255,255,255,.42);
            cursor: pointer; user-select: none; border-radius: 8px;
            transition: color .2s, background .2s;
        }
        .sb-section-head:hover { color: rgba(255,255,255,.75); background: rgba(255,255,255,.04); }
        .sb-section-chevron { margin-left: auto; font-size: 9px; transition: transform .25s ease; }
        .sb-section.collapsed .sb-section-chevron { transform: rotate(-90deg); }
        .sb-section-body {
            max-height: 800px; overflow: hidden;
            transition: max-height .35s cubic-bezier(.4,0,.2,1), opacity .25s;
            opacity: 1; list-style: none;
            display: flex; flex-direction: column; gap: 2px;
        }
        .sb-section.collapsed .sb-section-body { max-height: 0; opacity: 0; }

        .sb-item {
            display: flex; align-items: center; gap: 12px; padding: 10px 14px;
            border-radius: 8px; color: var(--sidebar-text); font-size: 13.5px;
            font-weight: 500; cursor: pointer; transition: all .22s cubic-bezier(.4,0,.2,1);
            position: relative; overflow: hidden; list-style: none;
        }
        .sb-item i { width: 18px; text-align: center; font-size: 14px; color: var(--sidebar-text); transition: color .15s; flex-shrink: 0; }
        .sb-item:hover { background: rgba(255,255,255,0.06); color: #fff; transform: translateX(2px); }
        .sb-item:hover i { color: #fff; }
        .sb-item.active {
            background: linear-gradient(90deg, rgba(16,185,129,.95), rgba(52,211,153,.85)) !important;
            color: #fff; font-weight: 600;
            box-shadow: 0 6px 18px rgba(16,185,129,.45), inset 0 1px 0 rgba(255,255,255,.15) !important;
        }
        .sb-item.active i { color: #fff; }
        .sb-item.active::before {
            content: ''; position: absolute; left: 0; top: 12%; bottom: 12%;
            width: 3px; background: #fff; border-radius: 0 3px 3px 0;
            animation: glowBar .4s ease;
        }
        @keyframes glowBar { from { height: 0; top: 50%; } to { height: 76%; top: 12%; } }

        .sb-badge {
            margin-left: auto; background: #ffedd5; color: #c2410c;
            font-size: 10px; font-weight: 800; padding: 2px 8px; border-radius: 12px;
        }

        .sb-tag {
            margin-left: auto; font-size: 9px; font-weight: 800;
            padding: 2px 7px; border-radius: 20px; letter-spacing: .3px;
            text-transform: uppercase;
        }
        .sb-tag.new { background: linear-gradient(135deg,#3b82f6,#6366f1); color: #fff; }
        .sb-tag.hot {
            background: linear-gradient(135deg,#f97316,#ef4444); color: #fff;
            animation: hotPulse 1.6s ease-in-out infinite;
        }
        @keyframes hotPulse {
            0%,100% { box-shadow: 0 0 0 0 rgba(239,68,68,.5); }
            50% { box-shadow: 0 0 0 6px rgba(239,68,68,0); }
        }

        .sb-item .live-dot {
            width: 7px; height: 7px; border-radius: 50%; background: #22c55e;
            box-shadow: 0 0 0 0 rgba(34,197,94,.6);
            animation: onlinePulse 2s infinite;
            margin-left: auto;
        }
        @keyframes onlinePulse {
            0%,100% { box-shadow: 0 0 0 0 rgba(34,197,94,.6); }
            50% { box-shadow: 0 0 0 4px rgba(34,197,94,0); }
        }

        .ripple {
            position: absolute; border-radius: 50%;
            background: rgba(255,255,255,.35);
            transform: scale(0); animation: rippleAnim .6s ease-out;
            pointer-events: none;
        }
        @keyframes rippleAnim { to { transform: scale(4); opacity: 0; } }

        .sb-user-card {
            display: flex; align-items: center; gap: 10px;
            padding: 10px 12px; border-radius: 10px;
            background: rgba(255,255,255,.05); margin: 0 12px 8px;
            cursor: pointer; transition: background .2s;
        }
        .sb-user-card:hover { background: rgba(255,255,255,.1); }
        .sb-user-avatar {
            width: 32px; height: 32px; border-radius: 50%;
            background: linear-gradient(135deg,#10b981,#34d399);
            color: #fff; display: grid; place-items: center;
            font-weight: 800; font-size: 13px; position: relative; flex-shrink: 0;
        }
        .sb-user-status {
            position: absolute; bottom: -1px; right: -1px;
            width: 10px; height: 10px; border-radius: 50%;
            background: #22c55e; border: 2px solid #0b3d2e;
            animation: onlinePulse 2s infinite;
        }
        .sb-user-meta strong { display: block; font-size: 12.5px; color: #fff; }
        .sb-user-meta span { font-size: 10.5px; color: var(--sidebar-text); }

        .sb-footer { padding: 14px; border-top: 1px solid rgba(255,255,255,0.06); }
        .sb-footer a {
            display: flex; align-items: center; gap: 10px; padding: 10px 14px;
            border-radius: 8px; color: #fca5a5; font-size: 13px; font-weight: 600;
        }
        .sb-footer a:hover { background: rgba(239,68,68,0.15); color: #fff; }

        /* Tooltip for collapsed rail */
        .admin-sidebar.collapsed .sb-item { position: relative; }
        .admin-sidebar.collapsed .sb-item:hover::after {
            content: attr(data-tooltip);
            position: absolute; left: 78px; top: 50%;
            transform: translateY(-50%);
            background: #0f172a; color: #fff;
            padding: 6px 12px; border-radius: 8px;
            font-size: 12px; font-weight: 600; white-space: nowrap;
            z-index: 999; box-shadow: 0 6px 20px rgba(0,0,0,.25);
            animation: tooltipIn .2s ease;
        }
        @keyframes tooltipIn { from { opacity: 0; transform: translateY(-50%) translateX(-6px); } }

        /* ================= MAIN ================= */
        .topbar {
            padding: 16px 28px; display: flex; align-items: center;
            justify-content: space-between; gap: 20px; background: var(--card-bg);
            border-bottom: 1px solid var(--border-light); position: sticky;
            top: 0; z-index: 100;
        }
        .topbar-title h1 { font-size: 18px; font-weight: 800; letter-spacing: -0.3px; }
        .topbar-title p { font-size: 12.5px; color: var(--text-muted); margin-top: 2px; }
        .topbar-right { display: flex; align-items: center; gap: 12px; }

        .topbar-live-clock {
            display: flex; align-items: center; gap: 6px;
            padding: 8px 12px; background: linear-gradient(135deg,#ecfdf5,#d1fae5);
            border-radius: 8px; font-size: 12px; font-weight: 700;
            color: #047857; border: 1px solid #a7f3d0;
        }
        .topbar-live-clock .dot {
            width: 6px; height: 6px; border-radius: 50%; background: #10b981;
            animation: liveDot 1.5s infinite;
        }
        @keyframes liveDot {
            0%,100% { opacity: 1; transform: scale(1); }
            50% { opacity: .4; transform: scale(1.3); }
        }
        [data-theme="dark"] .topbar-live-clock { background: #0f1720; border-color: #1e3a2f; }

        .topbar-search { position: relative; display: flex; align-items: center; }
        .topbar-search i { position: absolute; left: 12px; color: var(--text-light); font-size: 13px; }
        .topbar-search input {
            height: 38px; padding: 0 60px 0 36px; border: 1px solid var(--border-light);
            border-radius: 10px; font-size: 13px; outline: none; background: #f8fafc;
            width: 280px;
        }
        .topbar-search input:focus { border-color: var(--green-accent); background: #fff; }
        .topbar-kbd {
            position: absolute; right: 10px; top: 50%; transform: translateY(-50%);
            display: inline-flex; align-items: center; gap: 2px;
            padding: 2px 6px; border-radius: 5px;
            background: #fff; border: 1px solid var(--border-light);
            font-size: 10px; font-weight: 700; color: var(--text-muted);
            pointer-events: none;
        }
        .search-dropdown {
            position: absolute; top: 100%; left: 0; right: 0; margin-top: 6px;
            background: #fff; border: 1px solid var(--border-light); border-radius: 10px;
            box-shadow: 0 10px 30px rgba(0,0,0,0.1); max-height: 340px; overflow-y: auto;
            display: none; z-index: 200;
        }
        .search-dropdown.show { display: block; }
        .search-result-item {
            padding: 10px 14px; cursor: pointer; border-bottom: 1px solid #f1f5f9;
            display: flex; align-items: center; gap: 10px; font-size: 13px;
        }
        .search-result-item:hover { background: #f8fafc; }
        .search-result-item i { color: var(--green-accent); width: 16px; }

        .topbar-icon-btn {
            width: 38px; height: 38px; display: grid; place-items: center;
            border-radius: 10px; background: #f8fafc; color: var(--text-muted);
            cursor: pointer; border: 1px solid var(--border-light); position: relative;
            transition: all .15s;
        }
        .topbar-icon-btn:hover { color: var(--green-accent); border-color: var(--green-accent); }
        .topbar-icon-btn.has-badge::after {
            content: ''; position: absolute; top: 8px; right: 9px;
            width: 6px; height: 6px; background: var(--danger); border-radius: 50%;
            border: 1.5px solid #fff;
        }
        .topbar-icon-btn.shake { animation: bellShake .5s ease; }
        @keyframes bellShake {
            0%,100% { transform: rotate(0); }
            20% { transform: rotate(-12deg); }
            40% { transform: rotate(10deg); }
            60% { transform: rotate(-8deg); }
            80% { transform: rotate(6deg); }
        }

        .topbar-clock {
            font-size: 12px; font-weight: 700; color: var(--text-muted);
            padding: 8px 12px; background: #f8fafc; border-radius: 8px;
            border: 1px solid var(--border-light); display: flex; align-items: center; gap: 6px;
        }
        .topbar-clock i { color: var(--green-accent); }

        .topbar-profile {
            display: flex; align-items: center; gap: 10px; padding: 4px 12px 4px 4px;
            border-radius: 30px; background: #f8fafc; border: 1px solid var(--border-light);
            cursor: pointer; position: relative;
        }
        .topbar-avatar {
            width: 30px; height: 30px; border-radius: 50%; background: var(--green-dark);
            color: #fff; display: grid; place-items: center; font-size: 12px; font-weight: 700;
        }
        .topbar-user-name { font-size: 12.5px; font-weight: 700; line-height: 1.2; }
        .topbar-user-email { font-size: 11px; color: var(--text-muted); }

        .profile-dropdown {
            position: absolute; top: 100%; right: 0; margin-top: 8px; min-width: 220px;
            background: #fff; border: 1px solid var(--border-light); border-radius: 10px;
            box-shadow: 0 10px 30px rgba(0,0,0,0.1); overflow: hidden; display: none; z-index: 200;
        }
        .profile-dropdown.show { display: block; }
        .profile-dropdown a {
            display: flex; align-items: center; gap: 10px; padding: 10px 14px;
            font-size: 13px; font-weight: 600; color: var(--text-main);
            border-bottom: 1px solid #f1f5f9; cursor: pointer;
        }
        .profile-dropdown a:hover { background: #f8fafc; color: var(--green-accent); }
        .profile-dropdown a:last-child { border-bottom: 0; color: var(--danger); }
        .profile-dropdown-header { padding: 12px 14px; background: #f8fafc; border-bottom: 1px solid var(--border-light); }
        .profile-dropdown-header strong { font-size: 13px; display: block; }
        .profile-dropdown-header small { font-size: 11px; color: var(--text-muted); }

        .recent-views-dropdown {
            position: absolute; top: 100%; right: 0; margin-top: 8px; min-width: 260px;
            background: #fff; border: 1px solid var(--border-light); border-radius: 10px;
            box-shadow: 0 10px 30px rgba(0,0,0,0.1); display: none; z-index: 200;
        }
        .recent-views-dropdown.show { display: block; }
        .recent-views-dropdown h4 {
            padding: 10px 14px; font-size: 11px; font-weight: 800; color: var(--text-muted);
            text-transform: uppercase; letter-spacing: .5px; border-bottom: 1px solid var(--border-light);
        }
        .recent-view-item {
            padding: 10px 14px; font-size: 13px; font-weight: 600; cursor: pointer;
            border-bottom: 1px solid #f8fafc; display: flex; align-items: center; gap: 10px;
        }
        .recent-view-item:hover { background: #f8fafc; color: var(--green-accent); }
        .recent-view-item:last-child { border-bottom: 0; }

        .admin-content { padding: 24px 28px 60px; flex: 1; }
        .admin-view { display: none; }
        .admin-view.active { display: block; animation: fadeIn .35s ease; }
        @keyframes fadeIn { from { opacity: 0; transform: translateY(8px); } to { opacity: 1; transform: translateY(0); } }

        /* ================= STAT CARDS ================= */
        .cards-grid { display: grid; grid-template-columns: repeat(4, 1fr); gap: 16px; margin-bottom: 22px; }
        @media (max-width: 1100px) { .cards-grid { grid-template-columns: repeat(2, 1fr); } }
        @media (max-width: 600px) { .cards-grid { grid-template-columns: 1fr; } }

        .stat-card {
            background: var(--card-bg); border-radius: var(--radius-card); padding: 20px 22px;
            box-shadow: var(--shadow-card); border: 1px solid var(--border-light);
            transition: transform .2s, box-shadow .2s; position: relative; overflow: hidden;
        }
        .stat-card:hover { transform: translateY(-3px); box-shadow: 0 12px 30px rgba(16,185,129,.18), var(--shadow-hover); }
        .stat-card::before {
            content: ''; position: absolute; top: 0; left: 0; width: 4px; height: 100%;
            background: var(--green-accent); opacity: 0; transition: opacity .2s;
        }
        .stat-card:hover::before { opacity: 1; }

        .stat-label { font-size: 12px; font-weight: 600; color: var(--text-muted); margin-bottom: 10px; display: flex; align-items: center; justify-content: space-between; }
        .stat-label i { font-size: 16px; color: var(--green-soft); }
        .stat-value { font-size: 26px; font-weight: 800; line-height: 1.1; letter-spacing: -0.5px; }
        .stat-value.counting { color: var(--green-accent); }
        .stat-sub { font-size: 12px; font-weight: 600; margin-top: 10px; color: var(--green-accent); display: inline-flex; align-items: center; gap: 4px; }
        .stat-sub.warn { color: var(--warn); }
        .stat-sub.danger { color: var(--danger); }

        .trend-arrow {
            display: inline-flex; align-items: center; gap: 3px;
            font-size: 11px; font-weight: 800;
            padding: 2px 7px; border-radius: 20px;
        }
        .trend-arrow.up { background: #d1fae5; color: #047857; }
        .trend-arrow.down { background: #fee2e2; color: #b91c1c; }
        .trend-arrow.flat { background: #f1f5f9; color: #475569; }

        .sparkline { display: flex; align-items: flex-end; gap: 2px; height: 24px; margin-top: 10px; }
        .sparkline span {
            flex: 1; background: var(--green-accent); border-radius: 2px; opacity: .35;
            min-height: 3px; transition: opacity .2s;
            animation: sparkRise .7s cubic-bezier(.4,0,.2,1) backwards;
        }
        @keyframes sparkRise { from { height: 0 !important; } }
        .sparkline:hover span { opacity: 1; }

        /* ================= PANELS ================= */
        .panel {
            background: var(--card-bg); border-radius: var(--radius-card); padding: 22px 24px;
            box-shadow: var(--shadow-card); border: 1px solid var(--border-light); margin-bottom: 20px;
        }
        .panel-head { display: flex; align-items: center; justify-content: space-between; margin-bottom: 18px; flex-wrap: wrap; gap: 10px; }
        .panel-head h2 { font-size: 15.5px; font-weight: 800; letter-spacing: -0.2px; }
        .panel-head p { font-size: 12px; color: var(--text-muted); margin-top: 2px; }

        /* ================= TOOLBAR ================= */
        .toolbar {
            display: flex; align-items: center; gap: 10px; margin-bottom: 16px;
            flex-wrap: wrap; padding: 12px 14px; background: #f8fafc;
            border-radius: 10px; border: 1px solid #eef2f5;
        }
        .toolbar-search { position: relative; flex: 1; min-width: 200px; }
        .toolbar-search i { position: absolute; left: 12px; top: 50%; transform: translateY(-50%); color: var(--text-light); font-size: 13px; }
        .toolbar-search input {
            width: 100%; height: 36px; padding: 0 12px 0 34px; border: 1px solid var(--border-light);
            border-radius: 8px; font-size: 13px; outline: none; background: #fff;
        }
        .toolbar select, .toolbar .form-input {
            height: 36px; padding: 0 12px; border: 1px solid var(--border-light);
            border-radius: 8px; font-size: 13px; outline: none; background: #fff;
            cursor: pointer; min-width: 140px;
        }

        /* ================= DASHBOARD LAYOUT ================= */
        .dash-grid-2col { display: grid; grid-template-columns: 2fr 1fr; gap: 20px; margin-bottom: 20px; }
        @media (max-width: 1000px) { .dash-grid-2col { grid-template-columns: 1fr; } }
        .dash-grid-equal { display: grid; grid-template-columns: 1fr 1fr; gap: 20px; margin-bottom: 20px; }
        @media (max-width: 800px) { .dash-grid-equal { grid-template-columns: 1fr; } }
        .dash-grid-3col { display: grid; grid-template-columns: 1fr 1fr 1fr; gap: 20px; margin-bottom: 20px; }
        @media (max-width: 1000px) { .dash-grid-3col { grid-template-columns: 1fr; } }

        /* ================= CHARTS ================= */
        .chart-container {
            background: #f8fafc; border-radius: 10px; padding: 20px 18px 12px;
            height: 220px; display: flex; align-items: flex-end; gap: 10px;
            border: 1px solid #eef2f5; position: relative;
        }
        .chart-bar-group { flex: 1; display: flex; flex-direction: column; align-items: center; height: 100%; justify-content: flex-end; gap: 4px; }
        .chart-bar {
            width: 100%; background: linear-gradient(180deg, var(--green-accent) 0%, #34d399 100%);
            border-radius: 6px 6px 0 0; min-height: 8px; transition: all .2s;
            cursor: pointer; position: relative;
            animation: barGrow .9s cubic-bezier(.4,0,.2,1) backwards;
        }
        @keyframes barGrow { from { height: 0 !important; } }
        .chart-bar-group:nth-child(1) .chart-bar { animation-delay: .05s; }
        .chart-bar-group:nth-child(2) .chart-bar { animation-delay: .12s; }
        .chart-bar-group:nth-child(3) .chart-bar { animation-delay: .19s; }
        .chart-bar-group:nth-child(4) .chart-bar { animation-delay: .26s; }
        .chart-bar-group:nth-child(5) .chart-bar { animation-delay: .33s; }
        .chart-bar-group:nth-child(6) .chart-bar { animation-delay: .4s; }
        .chart-bar-group:nth-child(7) .chart-bar { animation-delay: .47s; }
        .chart-bar:hover { opacity: .85; transform: scaleY(1.02); }
        .chart-bar::after {
            content: attr(data-val); position: absolute; top: -26px; left: 50%;
            transform: translateX(-50%); background: var(--text-main); color: white;
            font-size: 11px; font-weight: 700; padding: 3px 8px; border-radius: 6px;
            opacity: 0; white-space: nowrap; transition: opacity .15s;
        }
        .chart-bar:hover::after { opacity: 1; }
        .chart-label { font-size: 11px; font-weight: 600; color: var(--text-muted); margin-top: 6px; }

        .donut-wrap { display: flex; align-items: center; gap: 20px; }
        .donut {
            width: 120px; height: 120px; border-radius: 50%;
            background: conic-gradient(
                var(--green-accent) 0% 45%,
                var(--info) 45% 75%,
                var(--warn) 75% 90%,
                var(--danger) 90% 100%
            );
            position: relative; flex-shrink: 0;
            animation: donutIn .9s cubic-bezier(.4,0,.2,1);
        }
        @keyframes donutIn {
            from { transform: rotate(-140deg) scale(.6); opacity: 0; }
            to { transform: rotate(0) scale(1); opacity: 1; }
        }
        .donut::after { content: ''; position: absolute; inset: 18px; background: #f8fafc; border-radius: 50%; }
        .donut-legend { flex: 1; display: flex; flex-direction: column; gap: 10px; }
        .legend-row { display: flex; align-items: center; gap: 8px; font-size: 12.5px; font-weight: 600; }
        .legend-dot { width: 10px; height: 10px; border-radius: 50%; }
        .legend-val { margin-left: auto; color: var(--text-muted); font-weight: 700; }

        .h-bar-chart { display: flex; flex-direction: column; gap: 14px; }
        .h-bar-row { display: flex; align-items: center; gap: 10px; }
        .h-bar-label { min-width: 100px; font-size: 12.5px; font-weight: 600; }
        .h-bar-track { flex: 1; height: 20px; background: #f1f5f9; border-radius: 6px; overflow: hidden; }
        .h-bar-fill {
            height: 100%; background: linear-gradient(90deg, var(--green-accent) 0%, #34d399 100%);
            border-radius: 6px; transition: width .6s;
        }
        .h-bar-value { min-width: 60px; text-align: right; font-size: 12.5px; font-weight: 800; color: var(--text-main); }

        /* Progress ring */
        .progress-ring-wrap { display: flex; align-items: center; gap: 14px; padding: 4px 0; }
        .progress-ring { width: 68px; height: 68px; flex-shrink: 0; transform: rotate(-90deg); }
        .progress-ring circle {
            fill: none; stroke-width: 7; stroke-linecap: round;
            transition: stroke-dashoffset 1.1s cubic-bezier(.4,0,.2,1);
        }
        .progress-ring .bg { stroke: #e5e9ec; }
        .progress-ring .fg { stroke: var(--green-accent); }
        .progress-ring-text { font-size: 14px; font-weight: 800; }

        /* Timeline */
        .timeline { position: relative; padding-left: 22px; }
        .timeline::before {
            content: ''; position: absolute; left: 7px; top: 6px; bottom: 6px;
            width: 2px; background: linear-gradient(180deg, var(--green-accent), transparent);
        }
        .timeline-item { position: relative; padding-bottom: 18px; }
        .timeline-item:last-child { padding-bottom: 0; }
        .timeline-dot {
            position: absolute; left: -22px; top: 3px;
            width: 16px; height: 16px; border-radius: 50%;
            background: #fff; border: 3px solid var(--green-accent);
            box-shadow: 0 0 0 3px rgba(16,185,129,.15);
            animation: dotPop .5s ease;
        }
        @keyframes dotPop { from { transform: scale(0); } to { transform: scale(1); } }
        .timeline-time { font-size: 10.5px; color: var(--text-light); font-weight: 700; text-transform: uppercase; letter-spacing: .4px; }

        /* Live feed */
        .live-feed { max-height: 320px; overflow-y: auto; }
        .live-feed-item {
            display: flex; gap: 12px; padding: 12px;
            border-radius: 10px; margin-bottom: 8px;
            background: #f8fafc; border-left: 3px solid var(--green-accent);
            animation: feedIn .5s cubic-bezier(.5,1.6,.5,1);
        }
        @keyframes feedIn {
            from { opacity: 0; transform: translateX(-20px); }
            to { opacity: 1; transform: translateX(0); }
        }
        .live-feed-item .avatar {
            width: 34px; height: 34px; border-radius: 50%; flex-shrink: 0;
            display: grid; place-items: center; font-weight: 800; font-size: 12px;
            color: #fff; background: linear-gradient(135deg, #10b981, #34d399);
        }
        .live-feed-item .name { font-weight: 800; font-size: 12.5px; }
        .live-feed-item .meta { font-size: 11px; color: var(--text-muted); }

        /* ================= TABLES ================= */
        .table-wrap { overflow-x: auto; border-radius: 10px; border: 1px solid var(--border-light); }
        .data-table { width: 100%; border-collapse: collapse; font-size: 13px; min-width: 700px; }
        .data-table th {
            text-align: left; padding: 12px 16px; background: #f8fafc;
            border-bottom: 1px solid var(--border-light); font-size: 11px;
            font-weight: 800; text-transform: uppercase; letter-spacing: .5px; color: var(--text-muted);
        }
        .data-table td { padding: 14px 16px; border-bottom: 1px solid #f1f5f9; vertical-align: middle; }
        .data-table tr:last-child td { border-bottom: none; }
        .data-table tr:hover td { background: #fafbfd; }

        .id-cell { font-weight: 800; }
        .price-cell { font-weight: 800; }
        .cust-name { font-weight: 700; font-size: 13px; }
        .cust-sub { font-size: 11.5px; color: var(--text-muted); margin-top: 2px; }

        .icon-action-btn {
            background: none; border: 1px solid var(--border-light); border-radius: 6px;
            width: 28px; height: 28px; display: inline-grid; place-items: center;
            cursor: pointer; color: var(--text-muted); font-size: 12px; margin-right: 4px;
        }
        .icon-action-btn:hover { background: var(--green-light); color: var(--green-accent); border-color: var(--green-accent); }
        .icon-action-btn.danger:hover { background: #fef2f2; color: var(--danger); border-color: var(--danger); }

        /* ================= BADGES ================= */
        .badge {
            display: inline-flex; align-items: center; gap: 4px;
            padding: 4px 10px; border-radius: 20px; font-size: 11px;
            font-weight: 800; letter-spacing: .2px;
        }
        .badge.pending    { background: #fef3c7; color: #b45309; }
        .badge.processing { background: #dbeafe; color: #1d4ed8; }
        .badge.shipped    { background: #e0f2fe; color: #0369a1; }
        .badge.completed,
        .badge.delivered  { background: #d1fae5; color: #047857; }
        .badge.cancelled  { background: #fee2e2; color: #b91c1c; }
        .badge.active     { background: #d1fae5; color: #047857; }
        .badge.inactive   { background: #f1f5f9; color: #475569; }
        .badge.approved   { background: #dbeafe; color: #1d4ed8; }
        .badge.refunded   { background: #e0f2fe; color: #0369a1; }
        .badge.expired    { background: #fee2e2; color: #b91c1c; }
        .badge.vip        { background: linear-gradient(135deg, #fbbf24 0%, #f59e0b 100%); color: #fff; }

        .size-pill {
            background: #eff6ff; color: #1e40af; font-size: 11px;
            font-weight: 800; padding: 3px 8px; border-radius: 6px;
            display: inline-block; margin: 1px;
        }

        /* ================= PRODUCT CARDS ================= */
        .product-cards { display: grid; grid-template-columns: repeat(3, 1fr); gap: 18px; }
        .product-cards.list-view { grid-template-columns: 1fr; }
        @media (max-width: 1100px) { .product-cards { grid-template-columns: repeat(2, 1fr); } }
        @media (max-width: 650px) { .product-cards { grid-template-columns: 1fr; } }

        .product-card {
            background: var(--card-bg); border-radius: var(--radius-card);
            border: 1px solid var(--border-light); box-shadow: var(--shadow-card);
            overflow: hidden; display: flex; flex-direction: column;
            transition: transform .2s, box-shadow .2s; position: relative;
        }
        .product-cards.list-view .product-card { flex-direction: row; }
        .product-cards.list-view .product-thumb { width: 140px; height: auto; flex-shrink: 0; }
        .product-card:hover { transform: translateY(-4px); box-shadow: var(--shadow-hover); }
        .product-card.selected { border-color: var(--green-accent); box-shadow: 0 0 0 3px rgba(16,185,129,0.15); }
        .product-checkbox {
            position: absolute; top: 12px; left: 12px; width: 20px; height: 20px;
            accent-color: var(--green-accent); cursor: pointer; z-index: 2;
        }
        .product-thumb { width: 100%; height: 210px; object-fit: contain; background: #f8fafc; padding: 12px; transition: transform .25s ease; }
        .product-card:hover .product-thumb { transform: scale(1.03); }
        .img-count-badge {
            position: absolute; bottom: 8px; right: 8px;
            background: rgba(15,23,42,.8); color: #fff;
            padding: 3px 8px; border-radius: 6px; font-size: 11px; font-weight: 700;
            display: inline-flex; align-items: center; gap: 4px; z-index: 2;
            backdrop-filter: blur(4px);
        }

        /* Image Uploader & Multi-Image Gallery */
        .image-upload-dropzone {
            border: 2px dashed #cbd5e1; border-radius: 12px;
            padding: 24px 20px; text-align: center; background: #f8fafc;
            cursor: pointer; transition: border-color .2s, background-color .2s;
            margin-bottom: 12px;
        }
        .image-upload-dropzone:hover, .image-upload-dropzone.dragover {
            border-color: var(--green-accent); background: #f0fdf4;
        }
        .image-upload-dropzone i { font-size: 30px; color: var(--green-accent); margin-bottom: 8px; display: inline-block; }
        .image-upload-dropzone h4 { font-size: 13.5px; font-weight: 700; margin: 0 0 4px; color: var(--text-main); }
        .image-upload-dropzone p { font-size: 12px; color: var(--text-muted); margin: 0; }
        .product-images-gallery {
            display: grid; grid-template-columns: repeat(auto-fill, minmax(110px, 1fr));
            gap: 12px; margin-top: 12px;
        }
        .gallery-thumb-card {
            position: relative; background: #fff; border: 1px solid var(--border-light);
            border-radius: 8px; overflow: hidden; aspect-ratio: 1;
            display: flex; align-items: center; justify-content: center;
            box-shadow: 0 2px 5px rgba(0,0,0,.05); transition: transform .2s, box-shadow .2s;
        }
        .gallery-thumb-card:hover { transform: translateY(-2px); box-shadow: 0 4px 12px rgba(0,0,0,.1); }
        .gallery-thumb-card.is-primary { border: 2px solid var(--green-accent); box-shadow: 0 0 0 2px rgba(16,185,129,.2); }
        .gallery-thumb-img { width: 100%; height: 100%; object-fit: contain; padding: 6px; background: #f8fafc; }
        .gallery-thumb-primary-badge {
            position: absolute; top: 4px; left: 4px; background: var(--green-accent);
            color: #fff; font-size: 9px; font-weight: 800; padding: 2px 6px;
            border-radius: 4px; text-transform: uppercase; letter-spacing: .3px; z-index: 2;
        }
        .gallery-thumb-actions {
            position: absolute; bottom: 0; left: 0; right: 0;
            display: flex; gap: 4px; padding: 4px; background: rgba(15,23,42,.75);
            opacity: 0; transition: opacity .2s; z-index: 3;
        }
        .gallery-thumb-card:hover .gallery-thumb-actions { opacity: 1; }
        .gallery-action-btn {
            flex: 1; background: rgba(255,255,255,.9); border: none;
            border-radius: 4px; font-size: 11px; padding: 4px 0; cursor: pointer;
            color: var(--text-main); display: grid; place-items: center;
        }
        .gallery-action-btn:hover { background: #fff; color: var(--green-accent); }
        .gallery-action-btn.del:hover { background: #fee2e2; color: var(--danger); }
        .product-body { padding: 16px; flex: 1; display: flex; flex-direction: column; }
        .product-name { font-size: 14.5px; font-weight: 800; margin-bottom: 4px; }
        .product-price { font-size: 16px; font-weight: 800; color: var(--green-accent); margin-bottom: 12px; }
        .stock-pill {
            background: var(--green-light); color: var(--green-accent);
            font-size: 11.5px; font-weight: 800; padding: 4px 10px;
            border-radius: 12px; display: inline-block; margin-bottom: 12px; width: fit-content;
        }
        .stock-pill.low { background: #fef3c7; color: #b45309; }
        .stock-pill.out { background: #fee2e2; color: #b91c1c; }
        .product-actions { display: flex; gap: 8px; margin-top: auto; padding-top: 12px; border-top: 1px solid #f1f5f9; flex-wrap: wrap; }

        /* ================= STOCK CARDS ================= */
        .stock-grid { display: grid; grid-template-columns: repeat(3, 1fr); gap: 16px; }
        @media (max-width: 1000px) { .stock-grid { grid-template-columns: repeat(2, 1fr); } }
        @media (max-width: 600px) { .stock-grid { grid-template-columns: 1fr; } }

        .stock-card {
            background: var(--card-bg); border-radius: var(--radius-card);
            border: 1px solid var(--border-light); padding: 18px; box-shadow: var(--shadow-card);
        }
        .stock-card.low { border-color: #fbbf24; background: #fffbeb; }
        .stock-card.out { border-color: #ef4444; background: #fef2f2; }
        .stock-card-top { display: flex; justify-content: space-between; align-items: flex-start; margin-bottom: 12px; }
        .stock-card-title { font-size: 14.5px; font-weight: 800; }
        .stock-card-sub { font-size: 11.5px; color: var(--text-muted); margin-top: 2px; }
        .stock-total-pill {
            background: #e0f2fe; color: #0369a1; font-size: 11.5px;
            font-weight: 800; padding: 4px 10px; border-radius: 20px;
        }
        .stock-adjust { display: flex; gap: 8px; margin-top: 14px; padding-top: 14px; border-top: 1px solid #f1f5f9; flex-wrap: wrap; }
        .stock-adjust select, .stock-adjust input {
            padding: 6px 10px; border: 1px solid #cbd5e1;
            border-radius: 6px; font-size: 12px; font-weight: 600;
        }
        .stock-adjust select { flex: 1; min-width: 90px; }
        .stock-adjust input { width: 54px; text-align: center; }
        .stock-btn-add {
            background: var(--green-accent); color: #fff; border: none;
            padding: 6px 12px; border-radius: 6px; font-size: 11.5px; font-weight: 800; cursor: pointer;
        }
        .stock-btn-remove {
            background: var(--warn); color: #fff; border: none;
            padding: 6px 12px; border-radius: 6px; font-size: 11.5px; font-weight: 800; cursor: pointer;
        }

        /* ================= BUTTONS ================= */
        .btn {
            display: inline-flex; align-items: center; justify-content: center; gap: 6px;
            padding: 9px 16px; border-radius: 8px; border: none;
            background: var(--green-accent); color: #fff; font-size: 13px;
            font-weight: 700; cursor: pointer; transition: all .15s;
            box-shadow: 0 2px 6px rgba(16,185,129,0.2);
        }
        .btn:hover { opacity: .9; transform: translateY(-1px); }
        .btn-ghost { background: #fff; color: var(--text-main); border: 1px solid var(--border-light); box-shadow: none; }
        .btn-ghost:hover { border-color: var(--green-accent); color: var(--green-accent); transform: none; }
        .btn-sm { padding: 7px 12px; font-size: 12px; }
        .btn-xs { padding: 4px 8px; font-size: 11px; }
        .btn-danger { background: var(--danger); }
        .btn-warn { background: var(--warn); }
        .btn-info { background: var(--info); }

        /* ================= FORMS ================= */
        .form-grid { display: grid; grid-template-columns: repeat(3, 1fr); gap: 16px; margin-bottom: 18px; }
        .form-grid.two { grid-template-columns: repeat(2, 1fr); }
        @media (max-width: 800px) { .form-grid, .form-grid.two { grid-template-columns: 1fr; } }

        .form-group { display: flex; flex-direction: column; gap: 6px; }
        .form-group label { font-size: 12.5px; font-weight: 700; color: var(--text-main); }
        .form-group label .req { color: var(--danger); }
        .form-input {
            width: 100%; padding: 10px 12px; border: 1px solid var(--border-light);
            border-radius: 8px; font-size: 13px; font-family: inherit;
            outline: none; background: #fff; transition: all .15s;
        }
        .form-input:focus { border-color: var(--green-accent); box-shadow: 0 0 0 3px rgba(16,185,129,0.12); }
        .form-input.error { border-color: var(--danger); background: #fef2f2; }

        .val-banner {
            display: none; background: #fee2e2; border: 1px solid #fecaca;
            color: #b91c1c; padding: 12px 16px; border-radius: 8px;
            font-size: 13px; font-weight: 600; margin-bottom: 18px;
        }
        .val-banner.show { display: block; }

        .image-preview { margin-top: 8px; width: 100%; height: 100px; border-radius: 8px; object-fit: cover; border: 1px solid var(--border-light); display: none; }
        .image-preview.show { display: block; }

        /* ================= TOAST & MODAL ================= */
        .toast-stack { position: fixed; bottom: 24px; right: 24px; z-index: 3000; display: flex; flex-direction: column; gap: 10px; }
        .toast {
            padding: 14px 20px; border-radius: 10px; color: #fff;
            font-size: 13.5px; font-weight: 700;
            box-shadow: 0 8px 25px rgba(0,0,0,.15);
            animation: toastIn .35s cubic-bezier(.5,1.6,.5,1);
            display: flex; align-items: center; gap: 10px; min-width: 260px;
            position: relative; overflow: hidden;
        }
        .toast.success { background: var(--green-accent); }
        .toast.error { background: var(--danger); }
        .toast.info { background: var(--info); }
        .toast-close { margin-left: auto; background: none; border: none; color: #fff; cursor: pointer; opacity: .7; font-size: 14px; padding: 0; }
        .toast-close:hover { opacity: 1; }
        .toast-progress {
            position: absolute; bottom: 0; left: 0; height: 3px;
            background: rgba(255,255,255,.55); width: 100%;
            transform-origin: left; animation: toastProg 4s linear forwards;
        }
        @keyframes toastProg { to { transform: scaleX(0); } }
        @keyframes toastIn { from { opacity: 0; transform: translateY(20px) scale(0.95); } to { opacity: 1; transform: translateY(0) scale(1); } }

        .modal {
            position: fixed; inset: 0; background: rgba(15,23,42,.6);
            display: none; align-items: center; justify-content: center;
            z-index: 2000; padding: 20px; backdrop-filter: blur(3px);
        }
        .modal.open { display: flex; animation: fadeIn .2s ease; }
        .modal-box {
            background: var(--card-bg); border-radius: 16px; width: 100%; max-width: 620px;
            padding: 24px; box-shadow: 0 25px 50px -12px rgba(0,0,0,.25);
            animation: modalIn .3s cubic-bezier(.5,1.6,.5,1); max-height: 90vh; overflow-y: auto;
        }
        @keyframes modalIn { from { opacity: 0; transform: scale(0.95) translateY(10px); } to { opacity: 1; transform: scale(1) translateY(0); } }
        .modal-head { display: flex; justify-content: space-between; align-items: center; margin-bottom: 18px; padding-bottom: 14px; border-bottom: 1px solid var(--border-light); }
        .modal-head h3 { font-size: 17px; font-weight: 800; }
        .modal-close { background: none; border: none; font-size: 22px; color: var(--text-light); cursor: pointer; }
        .modal-close:hover { color: var(--danger); }

        .empty-msg { text-align: center; padding: 40px 20px; color: var(--text-muted); font-size: 13.5px; font-weight: 600; }
        .empty-msg i { display: block; font-size: 32px; color: var(--text-light); margin-bottom: 12px; }

        /* Settings Tabs */
        .tabs-nav { display: flex; gap: 4px; border-bottom: 2px solid var(--border-light); margin-bottom: 20px; overflow-x: auto; }
        .tabs-nav button {
            padding: 10px 18px; border: none; background: none;
            font-size: 13px; font-weight: 700; color: var(--text-muted);
            cursor: pointer; border-bottom: 2px solid transparent; margin-bottom: -2px;
            white-space: nowrap;
        }
        .tabs-nav button:hover { color: var(--green-accent); }
        .tabs-nav button.active { color: var(--green-accent); border-bottom-color: var(--green-accent); }
        .tab-content { display: none; }
        .tab-content.active { display: block; animation: fadeIn .2s ease; }

        /* Toggle Switch */
        .toggle-switch { position: relative; display: inline-block; width: 44px; height: 24px; }
        .toggle-switch input { opacity: 0; width: 0; height: 0; }
        .toggle-slider {
            position: absolute; inset: 0; background: #cbd5e1;
            border-radius: 24px; cursor: pointer; transition: .25s;
        }
        .toggle-slider::before {
            content: ''; position: absolute; left: 3px; top: 3px;
            width: 18px; height: 18px; background: #fff; border-radius: 50%;
            transition: .25s; box-shadow: 0 1px 3px rgba(0,0,0,.2);
        }
        .toggle-switch input:checked + .toggle-slider { background: var(--green-accent); }
        .toggle-switch input:checked + .toggle-slider::before { transform: translateX(20px); }

        /* Bulk bar slide */
        #bulkToolbar { animation: slideDown .3s ease; }
        @keyframes slideDown { from { opacity: 0; transform: translateY(-8px); } to { opacity: 1; transform: translateY(0); } }

        /* Scroll top FAB */
        .scroll-top-fab {
            position: fixed; bottom: 24px; left: 288px; z-index: 1500;
            width: 46px; height: 46px; border-radius: 50%;
            background: var(--green-dark); color: #fff; border: none;
            cursor: pointer; display: grid; place-items: center;
            font-size: 16px; opacity: 0; transform: translateY(20px) scale(.8);
            transition: all .3s cubic-bezier(.4,0,.2,1);
            box-shadow: 0 10px 25px rgba(11,61,46,.35);
        }
        .scroll-top-fab.show { opacity: 1; transform: translateY(0) scale(1); }
        .scroll-top-fab:hover { background: var(--green-accent); transform: translateY(-3px); }
        .scroll-top-fab.sidebar-collapsed { left: 100px; }

        .reveal { opacity: 0; transform: translateY(14px); transition: opacity .5s ease, transform .5s ease; }
        .reveal.in { opacity: 1; transform: translateY(0); }

        /* Skeleton */
        .skeleton {
            background: linear-gradient(90deg, #f1f5f9 25%, #e2e8f0 50%, #f1f5f9 75%);
            background-size: 200% 100%; animation: shimmer 1.5s infinite; border-radius: 6px;
        }
        @keyframes shimmer { 0% { background-position: 200% 0; } 100% { background-position: -200% 0; } }

        /* ================= RESPONSIVE ================= */
        .mobile-toggle { display: none; background: var(--green-dark); color: #fff; border: none; padding: 8px 12px; border-radius: 8px; font-size: 16px; cursor: pointer; }
        @media (max-width: 900px) {
            .admin-sidebar { transform: translateX(-100%); }
            .admin-sidebar.open { transform: translateX(0); }
            .admin-sidebar.collapsed { width: 264px; }
            .admin-sidebar.collapsed .sb-brand-text,
            .admin-sidebar.collapsed .sb-item span,
            .admin-sidebar.collapsed .sb-section-head span,
            .admin-sidebar.collapsed .sb-footer span,
            .admin-sidebar.collapsed .sb-user-meta { display: inline; }
            .admin-sidebar.collapsed .sb-item { justify-content: flex-start; padding: 10px 14px; }
            .admin-sidebar.collapsed .sb-footer a { justify-content: flex-start; padding: 10px 14px; }
            .admin-main { margin-left: 0 !important; }
            .mobile-toggle { display: inline-block; }
            .topbar-search { display: none; }
            .topbar-clock, .topbar-live-clock { display: none; }
            .topbar-profile .topbar-user-text { display: none; }
            .scroll-top-fab { left: 24px; }
        }

        @media print {
            .admin-sidebar, .topbar, .btn, .toolbar, .toast-stack, .scroll-top-fab { display: none !important; }
            .admin-main { margin-left: 0; }
            .panel { box-shadow: none; border: 1px solid #ccc; }
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="admin-layout">

            <!-- SIDEBAR -->
            <aside class="admin-sidebar" id="adminSidebar">
                <button type="button" class="sb-collapse-btn" id="sbCollapseBtn" title="Toggle sidebar">
                    <i class="fa-solid fa-chevron-left"></i>
                </button>
                <div class="sb-brand">
                    <div class="sb-brand-logo">T</div>
                    <div class="sb-brand-text">Textiles Admin</div>
                </div>
                <ul class="sb-menu" id="sbMenu">
                    <li class="sb-item active" data-view="dashboard" data-tooltip="Dashboard">
                        <i class="fa-solid fa-gauge-high"></i><span>Dashboard</span>
                    </li>

                    <li class="sb-section" data-section="catalog">
                        <div class="sb-section-head">
                            <i class="fa-solid fa-boxes-stacked" style="font-size:11px;"></i>
                            <span>Catalog</span>
                            <i class="fa-solid fa-chevron-down sb-section-chevron"></i>
                        </div>
                        <ul class="sb-section-body">
                            <li class="sb-item" data-view="products" data-tooltip="Products">
                                <i class="fa-solid fa-box"></i><span>Products</span>
                                <span class="sb-tag new">New</span>
                            </li>
                            <li class="sb-item" data-view="categories" data-tooltip="Categories">
                                <i class="fa-solid fa-layer-group"></i><span>Categories</span>
                            </li>
                            <li class="sb-item" data-view="inventory" data-tooltip="Inventory">
                                <i class="fa-solid fa-warehouse"></i><span>Inventory</span>
                                <span class="sb-badge" id="sbStockBadge" style="background:#fee2e2;color:#b91c1c;">3</span>
                            </li>
                            <li class="sb-item" data-view="collections" data-tooltip="Collections">
                                <i class="fa-solid fa-tags"></i><span>Collections</span>
                            </li>
                            <li class="sb-item" data-view="attributes" data-tooltip="Attributes">
                                <i class="fa-solid fa-palette"></i><span>Attributes & Colors</span>
                            </li>
                        </ul>
                    </li>

                    <li class="sb-section" data-section="sales">
                        <div class="sb-section-head">
                            <i class="fa-solid fa-chart-line" style="font-size:11px;"></i>
                            <span>Sales</span>
                            <i class="fa-solid fa-chevron-down sb-section-chevron"></i>
                        </div>
                        <ul class="sb-section-body">
                            <li class="sb-item" data-view="orders" data-tooltip="Orders">
                                <i class="fa-solid fa-cart-shopping"></i><span>Orders</span>
                                <span class="sb-badge" id="sbOrderBadge">6</span>
                            </li>
                            <li class="sb-item" data-view="returns" data-tooltip="Returns">
                                <i class="fa-solid fa-rotate-left"></i><span>Returns & Refunds</span>
                            </li>
                            <li class="sb-item" data-view="customers" data-tooltip="Customers">
                                <i class="fa-solid fa-users"></i><span>Customers</span>
                                <span class="live-dot"></span>
                            </li>
                            <li class="sb-item" data-view="reviews" data-tooltip="Reviews">
                                <i class="fa-regular fa-star"></i><span>Reviews</span>
                            </li>
                        </ul>
                    </li>

                    <li class="sb-section" data-section="marketing">
                        <div class="sb-section-head">
                            <i class="fa-solid fa-bullhorn" style="font-size:11px;"></i>
                            <span>Marketing</span>
                            <i class="fa-solid fa-chevron-down sb-section-chevron"></i>
                        </div>
                        <ul class="sb-section-body">
                            <li class="sb-item" data-view="coupons" data-tooltip="Coupons">
                                <i class="fa-solid fa-ticket"></i><span>Coupons</span>
                                <span class="sb-tag hot">Hot</span>
                            </li>
                            <li class="sb-item" data-view="campaigns" data-tooltip="Campaigns">
                                <i class="fa-solid fa-envelope-open-text"></i><span>Email Campaigns</span>
                            </li>
                        </ul>
                    </li>

                    <li class="sb-section" data-section="system">
                        <div class="sb-section-head">
                            <i class="fa-solid fa-sliders" style="font-size:11px;"></i>
                            <span>System</span>
                            <i class="fa-solid fa-chevron-down sb-section-chevron"></i>
                        </div>
                        <ul class="sb-section-body">
                            <li class="sb-item" data-view="notifications" data-tooltip="Notifications">
                                <i class="fa-regular fa-bell"></i><span>Notifications</span>
                                <span class="sb-badge" id="sbNotifBadge">4</span>
                            </li>
                            <li class="sb-item" data-view="activity" data-tooltip="Activity Log">
                                <i class="fa-solid fa-list-check"></i><span>Activity Log</span>
                            </li>
                            <li class="sb-item" data-view="users" data-tooltip="Admin Users">
                                <i class="fa-solid fa-user-shield"></i><span>Admin Users</span>
                            </li>
                            <li class="sb-item" data-view="settings" data-tooltip="Settings">
                                <i class="fa-solid fa-gear"></i><span>Settings</span>
                            </li>
                        </ul>
                    </li>
                </ul>

                <div class="sb-user-card" id="sbUserCard">
                    <div class="sb-user-avatar">A
                        <span class="sb-user-status"></span>
                    </div>
                    <div class="sb-user-meta">
                        <strong>Admin</strong>
                        <span>Super Admin</span>
                    </div>
                    <i class="fa-solid fa-ellipsis-vertical" style="margin-left:auto;color:var(--sidebar-text);font-size:12px;"></i>
                </div>

                <div class="sb-footer">
                    <a href="login.aspx?action=logout" id="adminSidebarLogout"><i class="fa-solid fa-arrow-right-from-bracket"></i><span>Logout</span></a>
                </div>
            </aside>

            <!-- MAIN -->
            <main class="admin-main" id="adminMain">
                <header class="topbar">
                    <div style="display:flex;align-items:center;gap:14px;">
                        <button type="button" class="mobile-toggle" id="mobileMenuBtn"><i class="fa-solid fa-bars"></i></button>
                        <div class="topbar-title">
                            <h1 id="pageTitle">Dashboard</h1>
                            <p id="pageSub">Overview of your store performance</p>
                        </div>
                    </div>
                    <div class="topbar-right">
                        <div class="topbar-live-clock" id="liveClock" title="Live time">
                            <span class="dot"></span>
                            <i class="fa-regular fa-clock"></i>
                            <span id="clockText">--:--:--</span>
                        </div>
                        <div class="topbar-search">
                            <i class="fa-solid fa-magnifying-glass"></i>
                            <input type="text" id="globalSearch" placeholder="Search anything..." autocomplete="off" />
                            <span class="topbar-kbd">Ctrl K</span>
                            <div class="search-dropdown" id="searchDropdown"></div>
                        </div>
                        <div class="topbar-icon-btn" id="recentViewsBtn" title="Recent views"><i class="fa-solid fa-clock-rotate-left"></i>
                            <div class="recent-views-dropdown" id="recentViewsDropdown">
                                <h4>Recent Views</h4>
                                <div id="recentViewsList"></div>
                            </div>
                        </div>
                        <div class="topbar-icon-btn has-badge" id="themeToggle" title="Toggle dark mode"><i class="fa-solid fa-moon"></i></div>
                        <div class="topbar-icon-btn has-badge" id="topbarBell" title="Notifications"><i class="fa-regular fa-bell"></i></div>
                        <div class="topbar-profile" id="topbarProfile">
                            <div class="topbar-avatar">A</div>
                            <div class="topbar-user-text">
                                <div class="topbar-user-name">Admin</div>
                                <div class="topbar-user-email">admin@textiles.com</div>
                            </div>
                            <div class="profile-dropdown" id="profileDropdown">
                                <div class="profile-dropdown-header">
                                    <strong>Admin User</strong>
                                    <small>admin@textiles.com</small>
                                </div>
                                <a data-action="profile"><i class="fa-solid fa-user"></i> My Profile</a>
                                <a data-navigate="settings"><i class="fa-solid fa-gear"></i> Settings</a>
                                <a data-action="help"><i class="fa-solid fa-question-circle"></i> Help & Docs</a>
                                <a data-action="reseed"><i class="fa-solid fa-rotate"></i> Reset Sample Data</a>
                                <a href="login.aspx?action=logout" id="adminDropdownLogout"><i class="fa-solid fa-arrow-right-from-bracket"></i> Logout</a>
                            </div>
                        </div>
                    </div>
                </header>

                <div class="admin-content">

                    <!-- DASHBOARD -->
                    <section id="view-dashboard" class="admin-view active">
                        <div class="cards-grid">
                            <div class="stat-card reveal">
                                <div class="stat-label">Total Revenue <i class="fa-solid fa-indian-rupee-sign"></i></div>
                                <div class="stat-value" id="statRevenue">₹0</div>
                                <div class="stat-sub"><i class="fa-solid fa-arrow-trend-up"></i> <span>+12.4%</span></div>
                                <div class="sparkline" id="sparkRevenue"></div>
                            </div>
                            <div class="stat-card reveal">
                                <div class="stat-label">Total Orders <i class="fa-solid fa-cart-shopping"></i></div>
                                <div class="stat-value" id="statOrders">0</div>
                                <div class="stat-sub warn"><i class="fa-solid fa-clock"></i> <span id="statOrdersSub">0 pending</span></div>
                                <div class="sparkline" id="sparkOrders"></div>
                            </div>
                            <div class="stat-card reveal">
                                <div class="stat-label">Total Customers <i class="fa-solid fa-users"></i></div>
                                <div class="stat-value" id="statCustomers">0</div>
                                <div class="stat-sub"><i class="fa-solid fa-user-plus"></i> <span id="statCustomersSub">0 active</span></div>
                                <div class="sparkline" id="sparkCustomers"></div>
                            </div>
                            <div class="stat-card reveal">
                                <div class="stat-label">Products <i class="fa-solid fa-box"></i></div>
                                <div class="stat-value" id="statProducts">0</div>
                                <div class="stat-sub danger"><i class="fa-solid fa-triangle-exclamation"></i> <span id="statProductsSub">0 low stock</span></div>
                                <div class="sparkline" id="sparkProducts"></div>
                            </div>
                        </div>

                        <div class="dash-grid-2col reveal">
                            <div class="panel">
                                <div class="panel-head">
                                    <div><h2>Revenue Overview</h2><p>Last 7 days performance</p></div>
                                    <span class="trend-arrow up"><i class="fa-solid fa-arrow-trend-up"></i> +18.2%</span>
                                </div>
                                <div class="chart-container" id="salesChart"></div>
                            </div>
                            <div class="panel">
                                <div class="panel-head"><div><h2>Order Status</h2><p>Current distribution</p></div></div>
                                <div class="donut-wrap" style="margin-top:20px;">
                                    <div class="donut"></div>
                                    <div class="donut-legend">
                                        <div class="legend-row"><span class="legend-dot" style="background:var(--green-accent)"></span> Delivered <span class="legend-val">45%</span></div>
                                        <div class="legend-row"><span class="legend-dot" style="background:var(--info)"></span> Processing <span class="legend-val">30%</span></div>
                                        <div class="legend-row"><span class="legend-dot" style="background:var(--warn)"></span> Shipped <span class="legend-val">15%</span></div>
                                        <div class="legend-row"><span class="legend-dot" style="background:var(--danger)"></span> Cancelled <span class="legend-val">10%</span></div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="dash-grid-2col reveal">
                            <div class="panel">
                                <div class="panel-head">
                                    <div><h2>Monthly Goals</h2><p>Progress toward targets</p></div>
                                    <span class="trend-arrow up"><i class="fa-solid fa-arrow-trend-up"></i> On track</span>
                                </div>
                                <div style="display:grid;grid-template-columns:1fr 1fr 1fr;gap:16px;">
                                    <div class="progress-ring-wrap">
                                        <svg class="progress-ring" viewBox="0 0 80 80" data-pct="78">
                                            <circle class="bg" cx="40" cy="40" r="32"></circle>
                                            <circle class="fg" cx="40" cy="40" r="32" stroke-dasharray="201" stroke-dashoffset="201"></circle>
                                        </svg>
                                        <div><div class="progress-ring-text" style="color:#047857;">78%</div><div style="font-size:11px;color:var(--text-muted);font-weight:600;">Revenue</div></div>
                                    </div>
                                    <div class="progress-ring-wrap">
                                        <svg class="progress-ring" viewBox="0 0 80 80" data-pct="62">
                                            <circle class="bg" cx="40" cy="40" r="32"></circle>
                                            <circle class="fg" cx="40" cy="40" r="32" stroke-dasharray="201" stroke-dashoffset="201" style="stroke:#3b82f6;"></circle>
                                        </svg>
                                        <div><div class="progress-ring-text" style="color:#1d4ed8;">62%</div><div style="font-size:11px;color:var(--text-muted);font-weight:600;">Orders</div></div>
                                    </div>
                                    <div class="progress-ring-wrap">
                                        <svg class="progress-ring" viewBox="0 0 80 80" data-pct="91">
                                            <circle class="bg" cx="40" cy="40" r="32"></circle>
                                            <circle class="fg" cx="40" cy="40" r="32" stroke-dasharray="201" stroke-dashoffset="201" style="stroke:#f59e0b;"></circle>
                                        </svg>
                                        <div><div class="progress-ring-text" style="color:#b45309;">91%</div><div style="font-size:11px;color:var(--text-muted);font-weight:600;">Retention</div></div>
                                    </div>
                                </div>
                            </div>
                            <div class="panel">
                                <div class="panel-head">
                                    <div><h2><span class="live-dot" style="display:inline-block;margin-right:6px;"></span>Live Order Feed</h2><p>Real-time</p></div>
                                </div>
                                <div class="live-feed" id="liveFeed">
                                    <div class="live-feed-item">
                                        <div class="avatar">R</div>
                                        <div style="flex:1;"><div class="name">Rohit Sharma</div><div class="meta">Order #TX-104857 · ₹5,396</div></div>
                                        <span class="badge pending">New</span>
                                    </div>
                                    <div class="live-feed-item">
                                        <div class="avatar" style="background:linear-gradient(135deg,#3b82f6,#6366f1);">P</div>
                                        <div style="flex:1;"><div class="name">Priya Patel</div><div class="meta">Order #TX-098721 · ₹3,497</div></div>
                                        <span class="badge shipped">Shipped</span>
                                    </div>
                                    <div class="live-feed-item">
                                        <div class="avatar" style="background:linear-gradient(135deg,#f59e0b,#ef4444);">A</div>
                                        <div style="flex:1;"><div class="name">Amit Kumar</div><div class="meta">Order #TX-087342 · ₹1,899</div></div>
                                        <span class="badge completed">Done</span>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="dash-grid-equal reveal">
                            <div class="panel">
                                <div class="panel-head"><div><h2>Category Revenue</h2><p>Sales by category</p></div></div>
                                <div class="h-bar-chart" id="categoryRevenueChart"></div>
                            </div>
                            <div class="panel">
                                <div class="panel-head">
                                    <div><h2>Quick Actions</h2><p>Common tasks</p></div>
                                </div>
                                <div style="display:grid;grid-template-columns:1fr 1fr;gap:10px;">
                                    <button type="button" class="btn btn-ghost" data-navigate="addProduct" style="justify-content:flex-start;padding:14px;"><i class="fa-solid fa-plus"></i> Add Product</button>
                                    <button type="button" class="btn btn-ghost" data-navigate="orders" style="justify-content:flex-start;padding:14px;"><i class="fa-solid fa-list-check"></i> View Orders</button>
                                    <button type="button" class="btn btn-ghost" data-navigate="coupons" style="justify-content:flex-start;padding:14px;"><i class="fa-solid fa-ticket"></i> Add Coupon</button>
                                    <button type="button" class="btn btn-ghost" data-navigate="customers" style="justify-content:flex-start;padding:14px;"><i class="fa-solid fa-users"></i> Customers</button>
                                </div>
                            </div>
                        </div>

                        <div class="dash-grid-equal reveal">
                            <div class="panel">
                                <div class="panel-head">
                                    <div><h2>Recent Orders</h2><p>Latest purchases</p></div>
                                    <button type="button" class="btn btn-ghost btn-sm" data-navigate="orders">View All</button>
                                </div>
                                <div class="table-wrap">
                                    <table class="data-table">
                                        <thead><tr><th>Order</th><th>Customer</th><th>Total</th><th>Status</th></tr></thead>
                                        <tbody id="dashboardOrdersBody"></tbody>
                                    </table>
                                </div>
                            </div>
                            <div class="panel">
                                <div class="panel-head"><div><h2>Top Selling</h2><p>Best performers</p></div></div>
                                <div class="top-prod-list" id="topProductsList"></div>
                            </div>
                        </div>

                        <div class="dash-grid-equal reveal">
                            <div class="panel">
                                <div class="panel-head"><div><h2>Recent Customers</h2><p>New registrations</p></div></div>
                                <div class="table-wrap" style="border:none;">
                                    <table class="data-table" style="min-width:100%;">
                                        <thead><tr><th>Customer</th><th>Joined</th><th>Orders</th></tr></thead>
                                        <tbody id="recentCustomersBody"></tbody>
                                    </table>
                                </div>
                            </div>
                            <div class="panel">
                                <div class="panel-head"><div><h2>Activity Timeline</h2><p>Latest events</p></div></div>
                                <div class="timeline">
                                    <div class="timeline-item">
                                        <span class="timeline-dot"></span>
                                        <div class="timeline-time">2 min ago</div>
                                        <div style="font-size:13px;font-weight:700;">Order #TX-104857 placed</div>
                                        <div style="font-size:12px;color:var(--text-muted);">₹5,396 by Rohit Sharma</div>
                                    </div>
                                    <div class="timeline-item">
                                        <span class="timeline-dot" style="border-color:#f59e0b;box-shadow:0 0 0 3px rgba(245,158,11,.15);"></span>
                                        <div class="timeline-time">18 min ago</div>
                                        <div style="font-size:13px;font-weight:700;">Low stock: CloudSoft Hoodie</div>
                                        <div style="font-size:12px;color:var(--text-muted);">Only 2 units remaining</div>
                                    </div>
                                    <div class="timeline-item">
                                        <span class="timeline-dot" style="border-color:#3b82f6;box-shadow:0 0 0 3px rgba(59,130,246,.15);"></span>
                                        <div class="timeline-time">1 hour ago</div>
                                        <div style="font-size:13px;font-weight:700;">New 5★ review on Sage Tee</div>
                                        <div style="font-size:12px;color:var(--text-muted);">By Rohit Sharma</div>
                                    </div>
                                    <div class="timeline-item">
                                        <span class="timeline-dot" style="border-color:#22c55e;box-shadow:0 0 0 3px rgba(34,197,94,.15);"></span>
                                        <div class="timeline-time">3 hours ago</div>
                                        <div style="font-size:13px;font-weight:700;">New customer registered</div>
                                        <div style="font-size:12px;color:var(--text-muted);">Karan Malhotra from Chandigarh</div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </section>

                    <!-- PRODUCTS -->
                    <section id="view-products" class="admin-view">
                        <div class="panel">
                            <div class="panel-head">
                                <div><h2>Manage Products</h2><p>Add, edit, or remove products</p></div>
                                <div style="display:flex;gap:8px;">
                                    <button type="button" class="btn btn-ghost btn-sm" id="btnToggleView"><i class="fa-solid fa-list"></i> List View</button>
                                    <button type="button" class="btn btn-ghost btn-sm" id="btnExportProducts"><i class="fa-solid fa-download"></i> Export</button>
                                    <button type="button" class="btn" data-navigate="addProduct"><i class="fa-solid fa-plus"></i> Add Product</button>
                                </div>
                            </div>
                            <div class="toolbar">
                                <div class="toolbar-search">
                                    <i class="fa-solid fa-magnifying-glass"></i>
                                    <input type="text" id="productSearch" placeholder="Search products..." />
                                </div>
                                <select id="productCategoryFilter">
                                    <option value="">All Categories</option>
                                    <option value="T-Shirts">T-Shirts</option>
                                    <option value="Shirts">Shirts</option>
                                    <option value="Jeans">Jeans</option>
                                    <option value="Jackets">Jackets</option>
                                    <option value="Hoodies">Hoodies</option>
                                </select>
                                <select id="productSort">
                                    <option value="">Sort: Default</option>
                                    <option value="price-asc">Price: Low to High</option>
                                    <option value="price-desc">Price: High to Low</option>
                                    <option value="stock-asc">Stock: Low to High</option>
                                    <option value="name">Name A-Z</option>
                                </select>
                            </div>
                            <div id="bulkToolbar" style="display:none;padding:10px 14px;background:#eaf3e8;border-radius:8px;margin-bottom:14px;align-items:center;gap:10px;">
                                <strong><span id="bulkCount">0</span> selected</strong>
                                <button type="button" class="btn btn-sm" data-action="bulk-activate"><i class="fa-solid fa-check"></i> Activate</button>
                                <button type="button" class="btn btn-sm btn-ghost" data-action="bulk-deactivate"><i class="fa-solid fa-eye-slash"></i> Deactivate</button>
                                <button type="button" class="btn btn-sm btn-danger" data-action="bulk-delete"><i class="fa-solid fa-trash"></i> Delete</button>
                                <button type="button" class="btn btn-sm btn-ghost" data-action="bulk-clear" style="margin-left:auto;">Clear</button>
                            </div>
                            <div class="product-cards" id="productsGrid"></div>
                        </div>
                    </section>

                    <!-- ADD PRODUCT -->
                    <section id="view-addProduct" class="admin-view">
                        <div class="panel">
                            <div class="panel-head">
                                <div><h2 id="addProductTitle">Add New Product</h2><p>Fill in the details</p></div>
                                <button type="button" class="btn btn-ghost btn-sm" data-navigate="products"><i class="fa-solid fa-arrow-left"></i> Back</button>
                            </div>
                            <div class="val-banner" id="productValBanner"></div>
                            <div class="form-grid">
                                <div class="form-group"><label>Product Name <span class="req">*</span></label><input type="text" class="form-input" id="pName" /></div>
                                <div class="form-group"><label>Category <span class="req">*</span></label>
                                    <select class="form-input" id="pCategory">
                                        <option value="">Select</option>
                                        <option value="T-Shirts">T-Shirts</option>
                                        <option value="Shirts">Shirts</option>
                                        <option value="Jeans">Jeans</option>
                                        <option value="Jackets">Jackets</option>
                                        <option value="Hoodies">Hoodies</option>
                                    </select>
                                </div>
                                <div class="form-group"><label>SKU <i class="fa-solid fa-info-circle" title="Auto-generated if empty" style="color:var(--text-light);cursor:help;"></i></label><input type="text" class="form-input" id="pSku" placeholder="TXT-XXXX" /></div>
                            </div>
                            <div class="form-grid">
                                <div class="form-group"><label>Price (₹) <span class="req">*</span></label><input type="number" class="form-input" id="pPrice" min="0" /></div>
                                <div class="form-group"><label>Original Price (₹)</label><input type="number" class="form-input" id="pOldPrice" min="0" /></div>
                                <div class="form-group"><label>Status</label>
                                    <select class="form-input" id="pActive"><option value="1">Active</option><option value="0">Inactive</option></select>
                                </div>
                            </div>
                            <div class="form-group" style="margin-bottom:20px;">
                                <div style="display:flex;justify-content:space-between;align-items:center;margin-bottom:8px;flex-wrap:wrap;gap:8px;">
                                    <label style="margin:0;font-weight:700;">Product Images <span class="req">*</span> <small style="font-weight:500;color:var(--text-muted);">(Upload 1 to 10 photos. First photo is Primary)</small></label>
                                    <span id="imgUploadCount" class="badge" style="background:#e0f2fe;color:#0369a1;font-weight:800;">0 / 10 images (Min: 1, Max: 10)</span>
                                </div>
                                <div class="image-upload-dropzone" id="imgDropzone">
                                    <i class="fa-solid fa-cloud-arrow-up"></i>
                                    <h4>Drag & drop product images here, or <span style="color:var(--green-accent);text-decoration:underline;">Browse Photos</span></h4>
                                    <p>Supports PNG, JPG, JPEG, WEBP. Minimum 1 photo, Maximum 10 photos allowed.</p>
                                    <input type="file" id="pImagesInput" accept="image/png,image/jpeg,image/webp,image/jpg" multiple style="display:none;" />
                                </div>
                                <div id="productImagesGallery" class="product-images-gallery"></div>
                            </div>
                            <div class="form-group" style="margin-bottom:20px;">
                                <label>Description</label>
                                <textarea class="form-input" id="pDesc" rows="3" placeholder="Enter product description, fabric specs, care details..."></textarea>
                            </div>
                            <div style="background:#f8fafc;border-radius:10px;padding:18px;margin-bottom:20px;">
                                <h3 style="font-size:13px;font-weight:800;margin-bottom:12px;">Size-wise Stock</h3>
                                <div class="form-grid" style="margin-bottom:0;">
                                    <div class="form-group"><label>S</label><input type="number" class="form-input" id="pStockS" value="0" min="0" /></div>
                                    <div class="form-group"><label>M</label><input type="number" class="form-input" id="pStockM" value="0" min="0" /></div>
                                    <div class="form-group"><label>L</label><input type="number" class="form-input" id="pStockL" value="0" min="0" /></div>
                                    <div class="form-group"><label>XL</label><input type="number" class="form-input" id="pStockXL" value="0" min="0" /></div>
                                    <div class="form-group"><label>XXL</label><input type="number" class="form-input" id="pStockXXL" value="0" min="0" /></div>
                                </div>
                            </div>
                            <div style="display:flex;gap:10px;">
                                <button type="button" class="btn" id="btnSaveProduct"><i class="fa-solid fa-check"></i> Save Product</button>
                                <button type="button" class="btn btn-ghost" id="btnCancelEdit">Cancel</button>
                            </div>
                        </div>
                    </section>

                    <!-- CATEGORIES -->
                    <section id="view-categories" class="admin-view">
                        <div class="panel">
                            <div class="panel-head"><div><h2>Categories</h2><p>Product categories and counts</p></div></div>
                            <div class="cards-grid" id="categoriesGrid"></div>
                        </div>
                    </section>

                    <!-- INVENTORY -->
                    <section id="view-inventory" class="admin-view">
                        <div class="panel">
                            <div class="panel-head">
                                <div><h2>Size-wise Inventory</h2><p>Update stock per size</p></div>
                                <label style="display:flex;align-items:center;gap:6px;font-size:12px;font-weight:600;cursor:pointer;">
                                    <input type="checkbox" id="lowStockOnly" style="accent-color:var(--green-accent);width:16px;height:16px;" /> Low stock only
                                </label>
                            </div>
                            <div class="stock-grid" id="stockGrid"></div>
                        </div>
                    </section>

                    <!-- COLLECTIONS -->
                    <section id="view-collections" class="admin-view">
                        <div class="panel">
                            <div class="panel-head">
                                <div><h2>Collections</h2><p>Curated product groupings</p></div>
                                <button type="button" class="btn" data-action="add-collection"><i class="fa-solid fa-plus"></i> New Collection</button>
                            </div>
                            <div class="table-wrap">
                                <table class="data-table">
                                    <thead><tr><th>Collection</th><th>Products</th><th>Status</th><th>Actions</th></tr></thead>
                                    <tbody>
                                        <tr><td class="cust-name">Summer Essentials</td><td>12</td><td><span class="badge active">Active</span></td><td><button class="icon-action-btn"><i class="fa-solid fa-pen"></i></button></td></tr>
                                        <tr><td class="cust-name">Winter Warmers</td><td>8</td><td><span class="badge active">Active</span></td><td><button class="icon-action-btn"><i class="fa-solid fa-pen"></i></button></td></tr>
                                        <tr><td class="cust-name">Premium Linen</td><td>5</td><td><span class="badge inactive">Inactive</span></td><td><button class="icon-action-btn"><i class="fa-solid fa-pen"></i></button></td></tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </section>

                    <!-- ATTRIBUTES -->
                    <section id="view-attributes" class="admin-view">
                        <div class="panel">
                            <div class="panel-head"><div><h2>Attributes & Colors</h2><p>Manage sizes, colors, fabrics</p></div></div>
                            <div class="cards-grid">
                                <div class="stat-card"><div class="stat-label">Colors</div><div class="stat-value">8</div><div class="stat-sub">Sage, Charcoal...</div></div>
                                <div class="stat-card"><div class="stat-label">Sizes</div><div class="stat-value">5</div><div class="stat-sub">S, M, L, XL, XXL</div></div>
                                <div class="stat-card"><div class="stat-label">Fabrics</div><div class="stat-value">4</div><div class="stat-sub">Cotton, Linen...</div></div>
                                <div class="stat-card"><div class="stat-label">Variants</div><div class="stat-value">22</div><div class="stat-sub">Active variants</div></div>
                            </div>
                        </div>
                    </section>

                    <!-- ORDERS -->
                    <section id="view-orders" class="admin-view">
                        <div class="panel">
                            <div class="panel-head">
                                <div><h2>Orders</h2><p>All customer orders</p></div>
                                <div style="display:flex;gap:8px;">
                                    <button type="button" class="btn btn-ghost btn-sm" id="btnExportOrders"><i class="fa-solid fa-download"></i> Export</button>
                                    <button type="button" class="btn btn-ghost btn-sm" id="btnPrintOrders"><i class="fa-solid fa-print"></i> Print</button>
                                </div>
                            </div>
                            <div class="toolbar">
                                <div class="toolbar-search">
                                    <i class="fa-solid fa-magnifying-glass"></i>
                                    <input type="text" id="orderSearch" placeholder="Search by ID, customer, email..." />
                                </div>
                                <select id="orderStatusFilter">
                                    <option value="">All Statuses</option>
                                    <option value="Pending">Pending</option>
                                    <option value="Processing">Processing</option>
                                    <option value="Shipped">Shipped</option>
                                    <option value="Delivered">Delivered</option>

                                    <option value="Cancelled">Cancelled</option>
                                </select>
                            </div>
                            <div class="table-wrap">
                                <table class="data-table">
                                    <thead><tr><th>Order ID</th><th>Customer</th><th>Total</th><th>Status</th><th>Date</th><th>Actions</th></tr></thead>
                                    <tbody id="ordersBody"></tbody>
                                </table>
                            </div>
                        </div>
                    </section>

                    <!-- RETURNS -->
                    <section id="view-returns" class="admin-view">
                        <div class="panel">
                            <div class="panel-head"><div><h2>Returns & Refunds</h2><p>Process requests</p></div></div>
                            <div class="table-wrap">
                                <table class="data-table">
                                    <thead><tr><th>Return ID</th><th>Order</th><th>Customer</th><th>Reason</th><th>Status</th><th>Action</th></tr></thead>
                                    <tbody id="returnsBody"></tbody>
                                </table>
                            </div>
                        </div>
                    </section>

                    <!-- CUSTOMERS -->
                    <section id="view-customers" class="admin-view">
                        <div class="panel">
                            <div class="panel-head"><div><h2>Customers</h2><p>Registered shoppers</p></div></div>
                            <div class="toolbar">
                                <div class="toolbar-search">
                                    <i class="fa-solid fa-magnifying-glass"></i>
                                    <input type="text" id="customerSearch" placeholder="Search by name, email, city..." />
                                </div>
                            </div>
                            <div class="table-wrap">
                                <table class="data-table">
                                    <thead><tr><th>ID</th><th>Name</th><th>Email</th><th>Phone</th><th>City</th><th>Orders</th><th>Joined</th></tr></thead>
                                    <tbody id="customersBody"></tbody>
                                </table>
                            </div>
                        </div>
                    </section>

                    <!-- REVIEWS -->
                    <section id="view-reviews" class="admin-view">
                        <div class="panel">
                            <div class="panel-head"><div><h2>Reviews & Ratings</h2><p>Customer feedback</p></div></div>
                            <div class="table-wrap">
                                <table class="data-table">
                                    <thead><tr><th>Product</th><th>Customer</th><th>Rating</th><th>Comment</th><th>Date</th><th>Action</th></tr></thead>
                                    <tbody id="reviewsBody"></tbody>
                                </table>
                            </div>
                        </div>
                    </section>

                    <!-- COUPONS -->
                    <section id="view-coupons" class="admin-view">
                        <div class="panel">
                            <div class="panel-head"><div><h2>Coupons</h2><p>Promotional codes</p></div></div>
                            <div class="form-grid">
                                <div class="form-group"><label>Code</label><input type="text" class="form-input" id="cCode" placeholder="SAVE20" /></div>
                                <div class="form-group"><label>Type</label>
                                    <select class="form-input" id="cType"><option value="Percentage">Percentage</option><option value="Flat">Flat</option></select>
                                </div>
                                <div class="form-group"><label>Value</label><input type="number" class="form-input" id="cValue" /></div>
                            </div>
                            <div class="form-grid">
                                <div class="form-group"><label>Min Order (₹)</label><input type="number" class="form-input" id="cMin" value="0" /></div>
                                <div class="form-group"><label>Expiry</label><input type="date" class="form-input" id="cExpiry" /></div>
                                <div class="form-group" style="align-self:flex-end;"><button type="button" class="btn" id="btnAddCoupon"><i class="fa-solid fa-plus"></i> Add Coupon</button></div>
                            </div>
                            <div class="table-wrap">
                                <table class="data-table">
                                    <thead><tr><th>Code</th><th>Discount</th><th>Min Order</th><th>Expiry</th><th>Status</th><th>Action</th></tr></thead>
                                    <tbody id="couponsBody"></tbody>
                                </table>
                            </div>
                        </div>
                    </section>

                    <!-- CAMPAIGNS -->
                    <section id="view-campaigns" class="admin-view">
                        <div class="panel">
                            <div class="panel-head">
                                <div><h2>Email Campaigns</h2><p>Marketing emails</p></div>
                                <button type="button" class="btn" data-action="new-campaign"><i class="fa-solid fa-plus"></i> New Campaign</button>
                            </div>
                            <div class="table-wrap">
                                <table class="data-table">
                                    <thead><tr><th>Campaign</th><th>Sent To</th><th>Open Rate</th><th>Status</th><th>Date</th></tr></thead>
                                    <tbody>
                                        <tr><td class="cust-name">Weekend Flash Sale</td><td>1,245</td><td><strong style="color:#047857;">42%</strong></td><td><span class="badge completed">Sent</span></td><td>28 Oct 2024</td></tr>
                                        <tr><td class="cust-name">New Arrivals: Winter</td><td>3,108</td><td><strong style="color:#047857;">38%</strong></td><td><span class="badge completed">Sent</span></td><td>20 Oct 2024</td></tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </section>

                    <!-- NOTIFICATIONS -->
                    <section id="view-notifications" class="admin-view">
                        <div class="panel">
                            <div class="panel-head">
                                <div><h2>Notifications</h2><p>Recent alerts</p></div>
                                <button type="button" class="btn btn-ghost btn-sm" id="btnMarkAllRead"><i class="fa-solid fa-check-double"></i> Mark all read</button>
                            </div>
                            <div id="notificationsList"></div>
                        </div>
                    </section>

                    <!-- ACTIVITY -->
                    <section id="view-activity" class="admin-view">
                        <div class="panel">
                            <div class="panel-head">
                                <div><h2>Activity Log</h2><p>Complete audit trail</p></div>
                                <select class="form-input" style="width:auto;padding:6px 10px;font-size:12px;" id="activityFilter">
                                    <option value="">All Actions</option>
                                    <option value="order">Orders</option>
                                    <option value="stock">Stock</option>
                                    <option value="review">Reviews</option>
                                    <option value="customer">Customers</option>
                                </select>
                            </div>
                            <div class="table-wrap">
                                <table class="data-table">
                                    <thead><tr><th>Action</th><th>User</th><th>Time</th></tr></thead>
                                    <tbody id="activityTableBody"></tbody>
                                </table>
                            </div>
                        </div>
                    </section>

                    <!-- ADMIN USERS -->
                    <section id="view-users" class="admin-view">
                        <div class="panel">
                            <div class="panel-head"><div><h2>Admin Users</h2><p>Team & permissions</p></div></div>
                            <div class="table-wrap">
                                <table class="data-table">
                                    <thead><tr><th>Admin ID</th><th>Username</th><th>Email</th><th>Role</th><th>Last Login</th></tr></thead>
                                    <tbody>
                                        <tr><td class="id-cell">#ADM-1</td><td class="cust-name">admin</td><td>admin@textiles.com</td><td><span class="badge processing">Super Admin</span></td><td>Just now</td></tr>
                                        <tr><td class="id-cell">#ADM-2</td><td class="cust-name">manager</td><td>manager@textiles.com</td><td><span class="badge completed">Manager</span></td><td>2 hours ago</td></tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </section>

                    <!-- SETTINGS -->
                    <section id="view-settings" class="admin-view">
                        <div class="panel">
                            <div class="panel-head"><div><h2>Store Settings</h2><p>Configure your store</p></div></div>
                            <div class="tabs-nav">
                                <button type="button" class="active" data-settings-tab="general">General</button>
                                <button type="button" data-settings-tab="shipping">Shipping</button>
                                <button type="button" data-settings-tab="payment">Payment</button>
                                <button type="button" data-settings-tab="email">Email</button>
                                <button type="button" data-settings-tab="advanced">Advanced</button>
                            </div>

                            <div class="tab-content active" data-settings-content="general">
                                <div class="form-grid two">
                                    <div class="form-group"><label>Store Name</label><input type="text" class="form-input" value="TEXTILES" /></div>
                                    <div class="form-group"><label>Support Email</label><input type="email" class="form-input" value="support@textiles.com" /></div>
                                </div>
                                <div class="form-grid two">
                                    <div class="form-group"><label>Phone</label><input type="text" class="form-input" value="+91 98251 44520" /></div>
                                    <div class="form-group"><label>Currency</label>
                                        <select class="form-input"><option>INR (₹)</option><option>USD ($)</option><option>EUR (€)</option></select>
                                    </div>
                                </div>
                                <div class="form-group" style="margin-bottom:18px;"><label>Address</label><textarea class="form-input">TEXTILES HQ, 42 MG Road, Bengaluru</textarea></div>
                                <div class="form-group" style="margin-bottom:18px;">
                                    <label>Store Logo</label>
                                    <div style="display:flex;align-items:center;gap:12px;">
                                        <div style="width:64px;height:64px;background:var(--green-dark);color:#fff;border-radius:10px;display:grid;place-items:center;font-size:24px;font-weight:800;">T</div>
                                        <button type="button" class="btn btn-ghost btn-sm">Upload Logo</button>
                                    </div>
                                </div>
                            </div>

                            <div class="tab-content" data-settings-content="shipping">
                                <div class="form-grid two">
                                    <div class="form-group"><label>Free Shipping Threshold (₹)</label><input type="number" class="form-input" value="999" /></div>
                                    <div class="form-group"><label>Standard Shipping Fee (₹)</label><input type="number" class="form-input" value="99" /></div>
                                </div>
                                <div class="form-group"><label>Shipping Partners</label><textarea class="form-input">BlueDart, Delhivery, Ekart</textarea></div>
                            </div>

                            <div class="tab-content" data-settings-content="payment">
                                <div style="display:flex;align-items:center;justify-content:space-between;padding:14px;background:#f8fafc;border-radius:8px;margin-bottom:12px;">
                                    <div><strong>Cash on Delivery</strong><div style="font-size:12px;color:var(--text-muted);">Accept COD orders</div></div>
                                    <label class="toggle-switch"><input type="checkbox" checked /><span class="toggle-slider"></span></label>
                                </div>
                                <div style="display:flex;align-items:center;justify-content:space-between;padding:14px;background:#f8fafc;border-radius:8px;margin-bottom:12px;">
                                    <div><strong>Online Payment</strong><div style="font-size:12px;color:var(--text-muted);">Razorpay gateway</div></div>
                                    <label class="toggle-switch"><input type="checkbox" checked /><span class="toggle-slider"></span></label>
                                </div>
                            </div>

                            <div class="tab-content" data-settings-content="email">
                                <div class="form-grid two">
                                    <div class="form-group"><label>SMTP Host</label><input type="text" class="form-input" value="smtp.textiles.com" /></div>
                                    <div class="form-group"><label>SMTP Port</label><input type="number" class="form-input" value="587" /></div>
                                </div>
                                <div class="form-grid two">
                                    <div class="form-group"><label>From Name</label><input type="text" class="form-input" value="TEXTILES" /></div>
                                    <div class="form-group"><label>From Email</label><input type="email" class="form-input" value="orders@textiles.com" /></div>
                                </div>
                            </div>

                            <div class="tab-content" data-settings-content="advanced">
                                <div style="display:flex;align-items:center;justify-content:space-between;padding:14px;background:#f8fafc;border-radius:8px;margin-bottom:12px;">
                                    <div><strong>Maintenance Mode</strong><div style="font-size:12px;color:var(--text-muted);">Hide store from public</div></div>
                                    <label class="toggle-switch"><input type="checkbox" id="maintenanceToggle" /><span class="toggle-slider"></span></label>
                                </div>
                                <div style="display:flex;align-items:center;justify-content:space-between;padding:14px;background:#f8fafc;border-radius:8px;margin-bottom:12px;">
                                    <div><strong>Low Stock Alerts</strong><div style="font-size:12px;color:var(--text-muted);">Email when stock ≤ 5</div></div>
                                    <label class="toggle-switch"><input type="checkbox" checked /><span class="toggle-slider"></span></label>
                                </div>
                            </div>

                            <button type="button" class="btn" id="btnSaveSettings" style="margin-top:16px;"><i class="fa-solid fa-check"></i> Save Settings</button>
                        </div>
                    </section>

                </div>
            </main>
        </div>

        <!-- MODAL -->
        <div class="modal" id="detailsModal">
            <div class="modal-box">
                <div class="modal-head">
                    <h3 id="dtlTitle">Details</h3>
                    <button type="button" class="modal-close" id="btnCloseModal">&times;</button>
                </div>
                <div id="dtlBody"></div>
            </div>
        </div>

        <!-- TOASTS -->
        <div class="toast-stack" id="toastStack"></div>

        <!-- SCROLL TOP FAB -->
        <button type="button" class="scroll-top-fab" id="scrollTopFab" title="Back to top">
            <i class="fa-solid fa-arrow-up"></i>
        </button>

<script>
    /* ================== DATA ================== */
    var DB = {
        products: [
            { id: 1, sku: "TXT-0001", name: "Essential Sage Tee", category: "T-Shirts", price: 999, oldPrice: 1299, stock: 42, s: 10, m: 12, l: 10, xl: 6, xxl: 4, image: "product-tee.jpg", desc: "Premium cotton tee", active: 1, sold: 124, revenue: 123876 },
            { id: 2, sku: "TXT-0002", name: "CloudSoft Hoodie", category: "Hoodies", price: 1499, oldPrice: 1899, stock: 2, s: 0, m: 1, l: 1, xl: 0, xxl: 0, image: "product-hoodie.jpg", desc: "Soft fleece hoodie", active: 1, sold: 98, revenue: 146902 },
            { id: 3, sku: "TXT-0003", name: "Linen Overshirt", category: "Shirts", price: 1799, oldPrice: 2199, stock: 18, s: 3, m: 5, l: 5, xl: 3, xxl: 2, image: "product-linen.jpg", desc: "Lightweight linen", active: 1, sold: 87, revenue: 156513 },
            { id: 4, sku: "TXT-0004", name: "Classic Everyday Shirt", category: "Shirts", price: 1299, oldPrice: 1599, stock: 0, s: 0, m: 0, l: 0, xl: 0, xxl: 0, image: "category-shirt.jpg", desc: "Everyday cotton shirt", active: 1, sold: 75, revenue: 97425 },
            { id: 5, sku: "TXT-0005", name: "Slim Fit Denim Jeans", category: "Jeans", price: 1899, oldPrice: 2399, stock: 27, s: 5, m: 7, l: 8, xl: 4, xxl: 3, image: "category-jeans.jpg", desc: "Stretch slim-fit denim", active: 1, sold: 65, revenue: 123435 },
            { id: 6, sku: "TXT-0006", name: "Relaxed Fit Jeans", category: "Jeans", price: 1699, oldPrice: 1999, stock: 15, s: 3, m: 4, l: 4, xl: 2, xxl: 2, image: "category-jeans.jpg", desc: "Relaxed straight fit", active: 1, sold: 54, revenue: 91746 },
            { id: 7, sku: "TXT-0007", name: "Urban Bomber Jacket", category: "Jackets", price: 2499, oldPrice: 3199, stock: 3, s: 0, m: 1, l: 1, xl: 1, xxl: 0, image: "category-jacket.jpg", desc: "Water-resistant bomber", active: 1, sold: 42, revenue: 104958 },
            { id: 8, sku: "TXT-0008", name: "Casual Fleece Hoodie", category: "Hoodies", price: 1299, oldPrice: 1599, stock: 22, s: 4, m: 6, l: 6, xl: 4, xxl: 2, image: "product-hoodie.jpg", desc: "Fleece-lined hoodie", active: 1, sold: 38, revenue: 49362 },
            { id: 9, sku: "TXT-0009", name: "Premium Cotton Tee", category: "T-Shirts", price: 849, oldPrice: 1099, stock: 55, s: 12, m: 15, l: 15, xl: 8, xxl: 5, image: "category-tshirt.jpg", desc: "Everyday cotton tee", active: 1, sold: 32, revenue: 27168 },
            { id: 10, sku: "TXT-0010", name: "Graphic Print Tee", category: "T-Shirts", price: 799, oldPrice: 999, stock: 12, s: 2, m: 4, l: 3, xl: 2, xxl: 1, image: "product-tee.jpg", desc: "Bold graphic tee", active: 1, sold: 28, revenue: 22372 },
            { id: 11, sku: "TXT-0011", name: "Checkered Casual Shirt", category: "Shirts", price: 1199, oldPrice: 1499, stock: 8, s: 1, m: 3, l: 2, xl: 1, xxl: 1, image: "category-shirt.jpg", desc: "Plaid checkered shirt", active: 1, sold: 21, revenue: 25179 },
            { id: 12, sku: "TXT-0012", name: "Padded Puffer Jacket", category: "Jackets", price: 3299, oldPrice: 3999, stock: 6, s: 1, m: 2, l: 2, xl: 1, xxl: 0, image: "category-jacket.jpg", desc: "Warm padded puffer", active: 1, sold: 15, revenue: 49485 }
        ],
        orders: [
            { id: "TX-2024-104857", customer_name: "Rohit Sharma", user_email: "rohit.sharma@example.com", total_amount: 5396, order_status: "Pending", date_formatted: "28 Oct 2024" },
            { id: "TX-2024-098721", customer_name: "Priya Patel", user_email: "priya.patel@example.com", total_amount: 3497, order_status: "Shipped", date_formatted: "15 Oct 2024" },
            { id: "TX-2024-087342", customer_name: "Amit Kumar", user_email: "amit.kumar@example.com", total_amount: 1899, order_status: "Completed", date_formatted: "03 Sep 2024" },
            { id: "TX-2024-075210", customer_name: "Sneha Reddy", user_email: "sneha.reddy@example.com", total_amount: 2498, order_status: "Processing", date_formatted: "22 Aug 2024" },
            { id: "TX-2024-068911", customer_name: "Vikram Joshi", user_email: "vikram.joshi@example.com", total_amount: 3299, order_status: "Cancelled", date_formatted: "10 Aug 2024" },
            { id: "TX-2024-055122", customer_name: "Anjali Nair", user_email: "anjali.nair@example.com", total_amount: 4598, order_status: "Completed", date_formatted: "05 Aug 2024" }
        ],
        customers: [
            { user_id: "C-1001", name: "Rohit Sharma", email: "rohit.sharma@example.com", phone: "9876543210", city: "Bengaluru", order_count: 3, date_formatted: "12 May 2024", spent: 12847 },
            { user_id: "C-1002", name: "Priya Patel", email: "priya.patel@example.com", phone: "9876543211", city: "Mumbai", order_count: 2, date_formatted: "22 Jun 2024", spent: 5496 },
            { user_id: "C-1003", name: "Amit Kumar", email: "amit.kumar@example.com", phone: "9876543212", city: "Delhi", order_count: 1, date_formatted: "08 Jul 2024", spent: 1899 },
            { user_id: "C-1004", name: "Sneha Reddy", email: "sneha.reddy@example.com", phone: "9876543213", city: "Hyderabad", order_count: 5, date_formatted: "14 Aug 2024", spent: 9870 },
            { user_id: "C-1005", name: "Vikram Joshi", email: "vikram.joshi@example.com", phone: "9876543214", city: "Pune", order_count: 1, date_formatted: "01 Sep 2024", spent: 1299 },
            { user_id: "C-1006", name: "Anjali Nair", email: "anjali.nair@example.com", phone: "9876543215", city: "Kochi", order_count: 4, date_formatted: "18 Sep 2024", spent: 6897 },
            { user_id: "C-1007", name: "Karan Malhotra", email: "karan.m@example.com", phone: "9876543216", city: "Chandigarh", order_count: 2, date_formatted: "25 Oct 2024", spent: 3498 }
        ],
        reviews: [
            { id: 1, product_name: "Essential Sage Tee", customer: "Rohit Sharma", rating: 5, comment: "Great fit, soft fabric.", date_formatted: "20 Oct 2024" },
            { id: 2, product_name: "CloudSoft Hoodie", customer: "Priya Patel", rating: 4.5, comment: "Very warm and comfy.", date_formatted: "12 Oct 2024" },
            { id: 3, product_name: "Slim Fit Jeans", customer: "Amit Kumar", rating: 4, comment: "Good quality denim.", date_formatted: "02 Oct 2024" }
        ],
        coupons: [
            { id: 1, code: "TEXTILES20", display: "20% Off", min: 999, expiry: "31 Dec 2024", status: "Active" },
            { id: 2, code: "WELCOME100", display: "₹100 Off", min: 500, expiry: "30 Nov 2024", status: "Active" }
        ],
        returns: [
            { id: "RET-1001", order: "TX-2024-104857", customer: "Rohit Sharma", reason: "Too small", status: "Pending" },
            { id: "RET-1002", order: "TX-2024-098721", customer: "Priya Patel", reason: "Color different", status: "Approved" }
        ],
        notifications: [
            { id: 1, icon: "fa-box", title: "Low stock alert", body: "CloudSoft Hoodie down to 2 units", time: "10 min ago", tone: "warn" },
            { id: 2, icon: "fa-cart-shopping", title: "New order", body: "TX-2024-104857 by Rohit Sharma", time: "1 hour ago", tone: "info" },
            { id: 3, icon: "fa-user-plus", title: "New customer", body: "Karan Malhotra registered", time: "3 hours ago", tone: "success" },
            { id: 4, icon: "fa-ticket", title: "Coupon expiring", body: "WELCOME100 expires in 3 days", time: "5 hours ago", tone: "warn" }
        ],
        activity: [
            { type: "order", title: "Order #TX-2024-104857 placed", body: "₹5,396 by Rohit Sharma", time: "2 min ago", icon: "fa-cart-shopping", color: "info", user: "system" },
            { type: "stock", title: "Low stock: CloudSoft Hoodie", body: "Only 2 units remaining", time: "18 min ago", icon: "fa-triangle-exclamation", color: "warn", user: "system" },
            { type: "review", title: "New 5★ review on Sage Tee", body: "By Rohit Sharma", time: "1 hour ago", icon: "fa-star", color: "success", user: "customer" },
            { type: "customer", title: "New customer registered", body: "Karan Malhotra from Chandigarh", time: "3 hours ago", icon: "fa-user-plus", color: "success", user: "system" }
        ]
    };

    var nextId = 100;
    var editingId = null;
    var selectedProducts = new Set();
    var recentViews = [];
    var currentProductView = 'grid';
    var liveFeedTimer = null;

    var VIEW_META = {
        dashboard: { title: 'Dashboard', sub: 'Overview of your store performance' },
        products: { title: 'Products', sub: 'Manage your product catalog' },
        addProduct: { title: 'Add Product', sub: 'Create a new product' },
        categories: { title: 'Categories', sub: 'Product categories' },
        inventory: { title: 'Inventory', sub: 'Update stock per size' },
        collections: { title: 'Collections', sub: 'Curated groupings' },
        attributes: { title: 'Attributes & Colors', sub: 'Sizes, colors, fabrics' },
        orders: { title: 'Orders', sub: 'All customer orders' },
        returns: { title: 'Returns & Refunds', sub: 'Process returns' },
        customers: { title: 'Customers', sub: 'Registered shoppers' },
        reviews: { title: 'Reviews', sub: 'Customer feedback' },
        coupons: { title: 'Coupons', sub: 'Promotional codes' },
        campaigns: { title: 'Email Campaigns', sub: 'Marketing emails' },
        notifications: { title: 'Notifications', sub: 'Recent alerts' },
        activity: { title: 'Activity Log', sub: 'Audit trail' },
        users: { title: 'Admin Users', sub: 'Team & permissions' },
        settings: { title: 'Settings', sub: 'Store configuration' }
    };

    /* HELPERS */
    function fmtINR(v) { return "\u20B9 " + Math.round(v).toLocaleString("en-IN"); }
    function escapeHtml(s) { return String(s == null ? '' : s).replace(/&/g, '&amp;').replace(/</g, '&lt;').replace(/>/g, '&gt;').replace(/"/g, '&quot;').replace(/'/g, '&#39;'); }
    function generateSku() { return 'TXT-' + String(nextId).padStart(4, '0'); }

    function showToast(msg, type, undoFn) {
        var stack = document.getElementById('toastStack');
        var t = document.createElement('div');
        t.className = 'toast ' + (type || 'success');
        var icon = type === 'error' ? 'fa-circle-xmark' : (type === 'info' ? 'fa-circle-info' : 'fa-circle-check');
        t.innerHTML = '<i class="fa-solid ' + icon + '"></i> <span>' + msg + '</span>' + (undoFn ? ' <button class="toast-undo" style="margin-left:6px;text-decoration:underline;background:none;border:none;color:#fff;cursor:pointer;font-weight:700;">Undo</button>' : '') + '<button class="toast-close">&times;</button><div class="toast-progress"></div>';
        t.querySelector('.toast-close').onclick = function () { t.remove(); };
        if (undoFn) {
            var undoBtn = t.querySelector('.toast-undo');
            if (undoBtn) undoBtn.onclick = function () { undoFn(); t.remove(); };
        }
        stack.appendChild(t);
        setTimeout(function () { t.style.opacity = '0'; t.style.transform = 'translateY(15px)'; t.style.transition = 'all .3s'; setTimeout(function () { if (t.parentNode) t.remove(); }, 300); }, 4000);
    }

    function badgeForStatus(s) {
        var k = (s || '').toLowerCase();
        var cls = 'pending';
        if (k === 'processing') cls = 'processing';
        else if (k === 'shipped') cls = 'shipped';
        else if (k === 'completed' || k === 'delivered') cls = 'completed';
        else if (k === 'cancelled') cls = 'cancelled';
        else if (k === 'approved') cls = 'approved';
        else if (k === 'refunded') cls = 'refunded';
        return '<span class="badge ' + cls + '"><i class="fa-solid fa-circle" style="font-size:6px;"></i> ' + escapeHtml(s) + '</span>';
    }

    function orderOptions(current) {
        var opts = ['Pending', 'Processing', 'Shipped', 'Delivered', 'Cancelled'];
        return opts.map(function (o) { return '<option value="' + o + '"' + (o === current ? ' selected' : '') + '>' + o + '</option>'; }).join('');
    }

    /* COUNT-UP */
    function animateCount(el, target, formatter) {
        if (!el) return;
        var start = 0, dur = 900, t0 = performance.now();
        el.classList.add('counting');
        function tick(now) {
            var p = Math.min((now - t0) / dur, 1);
            var eased = 1 - Math.pow(1 - p, 3);
            var val = start + (target - start) * eased;
            el.innerText = formatter ? formatter(val) : Math.round(val).toLocaleString('en-IN');
            if (p < 1) requestAnimationFrame(tick);
            else el.classList.remove('counting');
        }
        requestAnimationFrame(tick);
    }

    /* PROGRESS RINGS */
    function animateRings() {
        document.querySelectorAll('.progress-ring').forEach(function (svg) {
            var pct = parseInt(svg.getAttribute('data-pct'), 10);
            var circle = svg.querySelector('.fg');
            var r = 32, c = 2 * Math.PI * r;
            circle.setAttribute('stroke-dasharray', c);
            var offset = c - (pct / 100) * c;
            setTimeout(function () { circle.style.strokeDashoffset = offset; }, 120);
        });
    }

    /* LIVE CLOCK */
    function startClock() {
        var el = document.getElementById('clockText');
        if (!el) return;
        function tick() {
            var d = new Date();
            var h = String(d.getHours()).padStart(2, '0');
            var m = String(d.getMinutes()).padStart(2, '0');
            var s = String(d.getSeconds()).padStart(2, '0');
            el.innerText = h + ':' + m + ':' + s;
        }
        tick(); setInterval(tick, 1000);
    }

    /* LIVE ORDER FEED */
    function pushLiveFeedItem() {
        var feed = document.getElementById('liveFeed');
        if (!feed) return;
        var names = ['Neha Gupta', 'Ravi Menon', 'Sana Khan', 'Arjun Rao', 'Meera Iyer', 'Dev Sharma'];
        var amounts = [1299, 2499, 899, 3199, 1499, 999, 1799];
        var statuses = ['pending', 'processing', 'shipped', 'completed'];
        var n = names[Math.floor(Math.random() * names.length)];
        var a = amounts[Math.floor(Math.random() * amounts.length)];
        var st = statuses[Math.floor(Math.random() * statuses.length)];
        var id = 'TX-' + Math.floor(100000 + Math.random() * 900000);
        var colors = ['linear-gradient(135deg,#10b981,#34d399)', 'linear-gradient(135deg,#3b82f6,#6366f1)', 'linear-gradient(135deg,#f59e0b,#ef4444)', 'linear-gradient(135deg,#8b5cf6,#ec4899)'];
        var color = colors[Math.floor(Math.random() * colors.length)];
        var item = document.createElement('div');
        item.className = 'live-feed-item';
        item.innerHTML = '<div class="avatar" style="background:' + color + ';">' + n.charAt(0) + '</div>' +
            '<div style="flex:1;"><div class="name">' + n + '</div><div class="meta">Order #' + id + ' · ₹' + a.toLocaleString('en-IN') + '</div></div>' +
            '<span class="badge ' + st + '">' + st.charAt(0).toUpperCase() + st.slice(1) + '</span>';
        feed.insertBefore(item, feed.firstChild);
        if (feed.children.length > 6) feed.removeChild(feed.lastChild);
    }
    function startLiveFeed() {
        if (liveFeedTimer) clearInterval(liveFeedTimer);
        liveFeedTimer = setInterval(pushLiveFeedItem, 8000);
    }

    /* NAVIGATION */
    function switchNav(view) {
        document.querySelectorAll('.sb-item').forEach(function (x) { x.classList.toggle('active', x.getAttribute('data-view') === view); });
        document.querySelectorAll('.admin-view').forEach(function (v) { v.classList.toggle('active', v.id === 'view-' + view); });
        if (VIEW_META[view]) {
            document.getElementById('pageTitle').innerText = VIEW_META[view].title;
            document.getElementById('pageSub').innerText = VIEW_META[view].sub;
        }
        document.getElementById('adminSidebar').classList.remove('open');
        if (view !== 'addProduct') {
            recentViews = recentViews.filter(function (v) { return v !== view; });
            recentViews.unshift(view);
            if (recentViews.length > 5) recentViews = recentViews.slice(0, 5);
            renderRecentViews();
        }
        renderView(view);
        window.scrollTo({ top: 0, behavior: 'smooth' });
        // Trigger reveal animations
        setTimeout(applyReveal, 50);
    }

    function renderView(view) {
        if (view === 'dashboard') renderDashboard();
        if (view === 'products') renderProductsGrid();
        if (view === 'categories') renderCategories();
        if (view === 'inventory') renderStock();
        if (view === 'orders') renderOrders();
        if (view === 'returns') renderReturns();
        if (view === 'customers') renderCustomers();
        if (view === 'reviews') renderReviews();
        if (view === 'coupons') renderCoupons();
        if (view === 'notifications') renderNotifications();
        if (view === 'activity') renderActivity();
    }

    function renderRecentViews() {
        var list = document.getElementById('recentViewsList');
        if (recentViews.length === 0) { list.innerHTML = '<div style="padding:14px;font-size:12px;color:var(--text-muted);text-align:center;">No recent views yet</div>'; return; }
        list.innerHTML = recentViews.map(function (v) {
            var m = VIEW_META[v];
            if (!m) return '';
            return '<div class="recent-view-item" data-navigate="' + v + '"><i class="fa-solid fa-arrow-right" style="color:var(--green-accent);font-size:11px;"></i> ' + m.title + '</div>';
        }).join('');
    }

    /* DASHBOARD */
    function renderDashboard() {
        var orders = DB.orders;
        var analytics = DB.analytics || {};

        /* ---- STAT CARDS ---- */
        animateCount(document.getElementById('statRevenue'), DB.stats ? DB.stats.revenue : 0, function (v) { return fmtINR(v); });
        animateCount(document.getElementById('statOrders'), DB.stats ? DB.stats.orders : orders.length);
        animateCount(document.getElementById('statCustomers'), DB.stats ? DB.stats.customers : DB.customers.length);
        animateCount(document.getElementById('statProducts'), DB.stats ? DB.stats.products : DB.products.length);
        document.getElementById('statOrdersSub').innerText = (DB.stats ? DB.stats.pendingOrders : 0) + ' pending';
        document.getElementById('statCustomersSub').innerText = (DB.stats ? DB.stats.customers : DB.customers.length) + ' active';
        document.getElementById('statProductsSub').innerText = (DB.stats ? DB.stats.lowStock : 0) + ' low stock';

        /* ---- SPARKLINES from daily data ---- */
        var daily7 = analytics.daily7 || [];
        var sparkRevArr = daily7.map(function(d) { return d.revenue || 0; });
        var sparkOrdArr = daily7.map(function(d) { return d.orders || 0; });
        if (!sparkRevArr.some(function(v){return v>0;})) sparkRevArr = [1,1,1,1,1,1,1];
        if (!sparkOrdArr.some(function(v){return v>0;})) sparkOrdArr = [1,1,1,1,1,1,1];
        renderSparkline('sparkRevenue', sparkRevArr);
        renderSparkline('sparkOrders', sparkOrdArr);
        var custLen = DB.customers.length || 1;
        renderSparkline('sparkCustomers', sparkOrdArr.map(function(x){return Math.max(1,Math.round(x*custLen/10));}));
        renderSparkline('sparkProducts', [1,1,1,1,1,1,DB.products.length || 1]);

        /* ---- REVENUE TREND ARROW ---- */
        var revTrend = analytics.revTrendPct || 0;
        var trendArrow = document.querySelector('#view-dashboard .trend-arrow');
        if (trendArrow) {
            trendArrow.className = 'trend-arrow ' + (revTrend >= 0 ? 'up' : 'down');
            trendArrow.innerHTML = '<i class="fa-solid fa-arrow-trend-' + (revTrend >= 0 ? 'up' : 'down') + '"></i> ' + (revTrend >= 0 ? '+' : '') + revTrend + '%';
        }

        /* ---- REVENUE OVERVIEW BAR CHART ---- */
        if (daily7.length > 0) {
            var maxRev = Math.max.apply(null, daily7.map(function(d){return d.revenue||0;})) || 1;
            document.getElementById('salesChart').innerHTML = daily7.map(function(d) {
                var pct = Math.max(4, Math.round((d.revenue/maxRev)*100));
                return '<div class="chart-bar-group"><div class="chart-bar" style="height:' + pct + '%;" data-val="' + fmtINR(d.revenue) + ' (' + d.orders + ' orders)"></div><div class="chart-label">' + escapeHtml(d.date) + '</div></div>';
            }).join('');
        } else {
            document.getElementById('salesChart').innerHTML = '<div style="text-align:center;color:var(--text-muted);padding:40px;font-size:13px;">No orders in the last 7 days</div>';
        }

        /* ---- ORDER STATUS DONUT ---- */
        var sc = analytics.statusCounts || {};
        var statusOrder = ['Delivered','Pending','Processing','Shipped','Cancelled','Return Requested','Returned'];
        var statusColors = {'Delivered':'var(--green-accent)','Completed':'#10b981','Pending':'var(--warn)','Processing':'var(--info)','Shipped':'#8b5cf6','Cancelled':'var(--danger)','Return Requested':'#f97316','Returned':'#64748b'};
        var totalSC = Object.keys(sc).reduce(function(a,k){return a+(sc[k]||0);},0) || 1;
        var conicParts = [], legendParts = [], cumPct = 0;
        statusOrder.forEach(function(st) {
            var cnt = sc[st] || 0; if (!cnt) return;
            var pct = (cnt/totalSC)*100;
            var color = statusColors[st] || '#94a3b8';
            conicParts.push(color + ' ' + cumPct.toFixed(1) + '% ' + (cumPct+pct).toFixed(1) + '%');
            legendParts.push('<div class="legend-row"><span class="legend-dot" style="background:'+color+'"></span>'+escapeHtml(st)+'<span class="legend-val">'+Math.round(pct)+'%</span></div>');
            cumPct += pct;
        });
        var donutEl = document.querySelector('#view-dashboard .donut');
        if (donutEl) donutEl.style.background = 'conic-gradient(' + (conicParts.length ? conicParts.join(',') : 'var(--green-accent) 0% 100%') + ')';
        var donutLegend = document.querySelector('#view-dashboard .donut-legend');
        if (donutLegend) donutLegend.innerHTML = legendParts.join('') || '<div class="legend-row">No orders yet</div>';

        /* ---- MONTHLY GOALS RINGS ---- */
        var goals = analytics.goals || {revenuePct:0,ordersPct:0,retentionPct:0};
        var rings = document.querySelectorAll('#view-dashboard .progress-ring');
        var ringData = [
            {pct:goals.revenuePct,label:'Revenue',color:'#047857',stroke:'var(--green-accent)'},
            {pct:goals.ordersPct,label:'Orders',color:'#1d4ed8',stroke:'#3b82f6'},
            {pct:goals.retentionPct,label:'Retention',color:'#b45309',stroke:'#f59e0b'}
        ];
        rings.forEach(function(svg,i) {
            if (!ringData[i]) return;
            svg.setAttribute('data-pct', ringData[i].pct);
            var wrap = svg.parentElement;
            var textEl = wrap ? wrap.querySelector('.progress-ring-text') : null;
            if (textEl) { textEl.textContent = ringData[i].pct + '%'; textEl.style.color = ringData[i].color; }
            var fgCircle = svg.querySelector('.fg');
            if (fgCircle && i > 0) fgCircle.style.stroke = ringData[i].stroke;
        });

        /* ---- LIVE ORDER FEED (real recent orders) ---- */
        var liveFeed = analytics.liveFeed || [];
        var feedEl = document.getElementById('liveFeed');
        if (feedEl) {
            var feedColors = ['linear-gradient(135deg,#10b981,#34d399)','linear-gradient(135deg,#3b82f6,#6366f1)','linear-gradient(135deg,#f59e0b,#ef4444)','linear-gradient(135deg,#8b5cf6,#ec4899)','linear-gradient(135deg,#0ea5e9,#06b6d4)','linear-gradient(135deg,#22c55e,#84cc16)'];
            if (liveFeed.length > 0) {
                feedEl.innerHTML = liveFeed.map(function(item,idx) {
                    var initial = item.name ? item.name.charAt(0).toUpperCase() : '?';
                    var statusCls = (item.status||'').toLowerCase().replace(/ /g,'-');
                    return '<div class="live-feed-item">' +
                        '<div class="avatar" style="background:'+feedColors[idx%feedColors.length]+';">'+initial+'</div>' +
                        '<div style="flex:1;"><div class="name">'+escapeHtml(item.name)+'</div><div class="meta">Order #'+escapeHtml(item.id)+' &middot; '+fmtINR(item.amount)+'</div></div>' +
                        '<span class="badge '+statusCls+'">'+escapeHtml(item.status)+'</span>' +
                        '</div>';
                }).join('');
            } else {
                feedEl.innerHTML = '<div style="text-align:center;padding:20px;color:var(--text-muted);font-size:13px;">No recent orders</div>';
            }
        }

        /* ---- CATEGORY REVENUE BARS ---- */
        var catMap = {};
        DB.products.forEach(function(p) { catMap[p.category] = (catMap[p.category]||0) + p.revenue; });
        var catKeys = Object.keys(catMap).sort(function(a,b){return catMap[b]-catMap[a];});
        var catMax = catKeys.length ? Math.max.apply(null, catKeys.map(function(k){return catMap[k];})) : 1;
        document.getElementById('categoryRevenueChart').innerHTML = catKeys.map(function(k) {
            var pct = (catMap[k]/catMax)*100;
            return '<div class="h-bar-row"><div class="h-bar-label">'+escapeHtml(k)+'</div><div class="h-bar-track"><div class="h-bar-fill" style="width:'+pct+'%"></div></div><div class="h-bar-value">'+fmtINR(catMap[k])+'</div></div>';
        }).join('') || '<div style="color:var(--text-muted);font-size:13px;padding:10px;">No data</div>';

        /* ---- ACTIVITY TIMELINE (real from DB) ---- */
        var acts = DB.activity || [];
        var dotColors = {'order':'var(--green-accent)','review':'#3b82f6','user':'#22c55e','product':'#f59e0b','warn':'#f59e0b','info':'var(--green-accent)','error':'var(--danger)','return':'#f97316'};
        var actTimeline = document.querySelector('#view-dashboard .timeline');
        if (actTimeline) {
            if (acts.length > 0) {
                actTimeline.innerHTML = acts.slice(0,6).map(function(a) {
                    var dotColor = dotColors[a.tone] || dotColors[a.type] || 'var(--green-accent)';
                    return '<div class="timeline-item">' +
                        '<span class="timeline-dot" style="border-color:'+dotColor+';box-shadow:0 0 0 3px rgba(0,0,0,.06);"></span>' +
                        '<div class="timeline-time">'+escapeHtml(a.time)+'</div>' +
                        '<div style="font-size:13px;font-weight:700;">'+escapeHtml(a.title)+'</div>' +
                        '<div style="font-size:12px;color:var(--text-muted);">'+escapeHtml(a.body)+'</div>' +
                        '</div>';
                }).join('');
            } else {
                actTimeline.innerHTML = '<div style="color:var(--text-muted);font-size:13px;padding:10px;">No activity recorded yet.</div>';
            }
        }

        /* ---- RECENT ORDERS TABLE ---- */
        document.getElementById('dashboardOrdersBody').innerHTML = orders.slice(0,4).map(function(o) {
            return '<tr><td class="id-cell">#'+escapeHtml(o.id)+'</td><td class="cust-name">'+escapeHtml(o.customer_name)+'</td><td class="price-cell">'+fmtINR(o.total_amount)+'</td><td>'+badgeForStatus(o.order_status)+'</td></tr>';
        }).join('') || '<tr><td colspan="4" style="text-align:center;color:var(--text-muted);">No orders yet</td></tr>';

        /* ---- TOP SELLING ---- */
        var sorted = DB.products.slice().sort(function(a,b){return b.revenue-a.revenue;}).slice(0,5);
        document.getElementById('topProductsList').innerHTML = sorted.map(function(p) {
            return '<div class="top-prod-row" style="display:flex;align-items:center;gap:10px;padding:8px 0;border-bottom:1px solid #f1f5f9;">' +
                '<img src="'+escapeHtml(getProductImgUrl(p.image))+'" style="width:36px;height:36px;border-radius:6px;object-fit:cover;" onerror="this.onerror=null;this.src=\'images/sage_tee.jpg\'" />' +
                '<div style="flex:1;"><div style="font-weight:700;font-size:12.5px;">'+escapeHtml(p.name)+'</div><div style="font-size:11px;color:var(--text-muted);">'+p.sold+' sold</div></div>' +
                '<div style="font-weight:800;font-size:12.5px;">'+fmtINR(p.revenue)+'</div></div>';
        }).join('') || '<div style="color:var(--text-muted);font-size:13px;padding:10px;">No products yet</div>';

        /* ---- RECENT CUSTOMERS ---- */
        document.getElementById('recentCustomersBody').innerHTML = DB.customers.slice(0,4).map(function(c) {
            return '<tr><td><div class="cust-name">'+escapeHtml(c.name)+'</div><div class="cust-sub">'+escapeHtml(c.email)+'</div></td><td style="color:var(--text-muted);font-size:12px;">'+escapeHtml(c.date_formatted)+'</td><td><strong>'+c.order_count+'</strong></td></tr>';
        }).join('') || '<tr><td colspan="3" style="text-align:center;color:var(--text-muted);">No customers yet</td></tr>';

        animateRings();
        startLiveFeed();
    }
    function renderSparkline(id, data) {
        var max = Math.max.apply(null, data);
        document.getElementById(id).innerHTML = data.map(function (v) {
            return '<span style="height:' + (v / max * 100) + '%"></span>';
        }).join('');
    }

    /* PRODUCTS */
    function getFilteredProducts() {
        var term = (document.getElementById('productSearch').value || '').toLowerCase();
        var cat = document.getElementById('productCategoryFilter').value;
        var sort = document.getElementById('productSort').value;
        var list = DB.products.filter(function (p) {
            if (term && p.name.toLowerCase().indexOf(term) === -1 && p.category.toLowerCase().indexOf(term) === -1 && (p.sku || '').toLowerCase().indexOf(term) === -1) return false;
            if (cat && p.category !== cat) return false;
            return true;
        });
        if (sort === 'price-asc') list.sort(function (a, b) { return a.price - b.price; });
        else if (sort === 'price-desc') list.sort(function (a, b) { return b.price - a.price; });
        else if (sort === 'stock-asc') list.sort(function (a, b) { return a.stock - b.stock; });
        else if (sort === 'name') list.sort(function (a, b) { return a.name.localeCompare(b.name); });
        return list;
    }

    function renderProductsGrid() {
        var grid = document.getElementById('productsGrid');
        grid.className = 'product-cards' + (currentProductView === 'list' ? ' list-view' : '');
        var list = getFilteredProducts();
        if (list.length === 0) {
            grid.innerHTML = '<div class="empty-msg" style="grid-column:1/-1;"><i class="fa-solid fa-box-open"></i>No products found</div>';
            return;
        }
        grid.innerHTML = list.map(function (p) {
            var isSelected = selectedProducts.has(p.id);
            var statusBadge = p.active == 1 ? '<span class="badge active">Active</span>' : '<span class="badge inactive">Inactive</span>';
            var stockClass = p.stock === 0 ? 'out' : (p.stock <= 5 ? 'low' : '');
            var countBadge = (p.images && p.images.length > 1) ? '<span class="img-count-badge" title="' + p.images.length + ' photos"><i class="fa-solid fa-camera"></i> ' + p.images.length + '</span>' : '';
            return '<div class="product-card' + (isSelected ? ' selected' : '') + '">' +
                '<input type="checkbox" class="product-checkbox" data-id="' + p.id + '"' + (isSelected ? ' checked' : '') + ' />' +
                '<div style="position:relative;background:#f8fafc;overflow:hidden;">' +
                '<img src="' + escapeHtml(getProductImgUrl(p.image)) + '" class="product-thumb" alt="" onerror="this.onerror=null;this.src=\'images/sage_tee.jpg\'" />' +
                countBadge +
                '</div>' +
                '<div class="product-body">' +
                '<div style="display:flex;justify-content:space-between;align-items:flex-start;"><div class="product-name">' + escapeHtml(p.name) + '</div>' + statusBadge + '</div>' +
                '<div class="product-price">' + fmtINR(p.price) + ' <small style="color:var(--text-light);font-weight:500;font-size:11px;">' + escapeHtml(p.sku || '') + '</small></div>' +
                '<div style="display:flex;gap:4px;flex-wrap:wrap;margin-bottom:10px;">' +
                '<span class="size-pill">S:' + p.s + '</span><span class="size-pill">M:' + p.m + '</span><span class="size-pill">L:' + p.l + '</span><span class="size-pill">XL:' + p.xl + '</span><span class="size-pill">XXL:' + p.xxl + '</span>' +
                '</div>' +
                '<div class="stock-pill ' + stockClass + '">Stock: ' + p.stock + '</div>' +
                '<div class="product-actions">' +
                '<button type="button" class="btn btn-sm" data-action="view" data-id="' + p.id + '"><i class="fa-solid fa-eye"></i></button>' +
                '<button type="button" class="btn btn-sm btn-ghost" data-action="edit" data-id="' + p.id + '"><i class="fa-solid fa-pen"></i></button>' +
                '<button type="button" class="btn btn-sm btn-ghost" data-action="duplicate" data-id="' + p.id + '"><i class="fa-solid fa-copy"></i></button>' +
                '<button type="button" class="btn btn-sm btn-danger" data-action="delete" data-id="' + p.id + '" style="margin-left:auto;"><i class="fa-solid fa-trash"></i></button>' +
                '</div></div></div>';
        }).join('');
        updateBulkToolbar();
    }

    function updateBulkToolbar() {
        var bulkToolbar = document.getElementById('bulkToolbar');
        document.getElementById('bulkCount').innerText = selectedProducts.size;
        bulkToolbar.style.display = selectedProducts.size > 0 ? 'flex' : 'none';
    }

    function deleteProduct(id) {
        if (!confirm('Are you sure you want to delete this product?')) return;
        var fd = new URLSearchParams();
        fd.append('action', 'admin_delete_product');
        fd.append('id', id);
        fetch('Api.ashx', { method: 'POST', body: fd })
            .then(function (r) { return r.json(); })
            .then(function (res) {
                if (res.success) {
                    showToast('Product deleted from database', 'success');
                    selectedProducts.delete(id);
                    loadAdminData();
                } else {
                    showToast(res.message || 'Error deleting product', 'error');
                }
            });
    }

    function duplicateProduct(id) {
        var p = DB.products.find(function (x) { return x.id === id; });
        if (!p) return;
        var copy = JSON.parse(JSON.stringify(p));
        copy.id = nextId++;
        copy.sku = generateSku();
        copy.name = copy.name + ' (Copy)';
        copy.sold = 0; copy.revenue = 0;
        DB.products.push(copy);
        renderProductsGrid(); renderDashboard();
        showToast('Product duplicated: ' + copy.name, 'success');
    }

    function editProduct(id) {
        var p = DB.products.find(function (x) { return x.id === id; });
        if (!p) return;
        editingId = id;
        document.getElementById('pName').value = p.name;
        document.getElementById('pCategory').value = p.category;
        document.getElementById('pSku').value = p.sku || '';
        document.getElementById('pPrice').value = p.price;
        document.getElementById('pOldPrice').value = p.oldPrice;
        document.getElementById('pDesc').value = p.desc || '';
        document.getElementById('pActive').value = String(p.active);
        document.getElementById('pStockS').value = p.s;
        document.getElementById('pStockM').value = p.m;
        document.getElementById('pStockL').value = p.l;
        document.getElementById('pStockXL').value = p.xl;
        document.getElementById('pStockXXL').value = p.xxl;

        // Populate multiple images
        currentProductImages = (p.images && p.images.length > 0) ? p.images.slice() : (p.image ? [p.image] : ['images/sage_tee.jpg']);
        renderImagesGallery();

        document.getElementById('addProductTitle').innerText = 'Edit Product';
        switchNav('addProduct');
    }

    function resetProductForm() {
        editingId = null;
        ['pName', 'pPrice', 'pOldPrice', 'pDesc', 'pCategory', 'pSku'].forEach(function (id) {
            var el = document.getElementById(id);
            if (el) el.value = '';
        });
        document.getElementById('pActive').value = '1';
        ['pStockS', 'pStockM', 'pStockL', 'pStockXL', 'pStockXXL'].forEach(function (id) {
            var el = document.getElementById(id);
            if (el) el.value = '0';
        });
        currentProductImages = [];
        renderImagesGallery();
        document.getElementById('addProductTitle').innerText = 'Add New Product';
        document.getElementById('productValBanner').classList.remove('show');
        document.querySelectorAll('.form-input.error').forEach(function (e) { e.classList.remove('error'); });
    }

    function getProductImgUrl(img) {
        if (!img) return 'images/sage_tee.jpg';
        img = String(img).trim();
        if (img.startsWith('http://') || img.startsWith('https://') || img.startsWith('data:')) return img;
        if (img.startsWith('/')) return img.substring(1);
        if (img.toLowerCase().startsWith('images/')) return img;
        return 'images/' + img;
    }

    // MULTI-IMAGE UPLOADER STATE & FUNCTIONS
    var currentProductImages = [];

    function initImageUploader() {
        var dropzone = document.getElementById('imgDropzone');
        var fileInput = document.getElementById('pImagesInput');
        if (!dropzone || !fileInput) return;

        dropzone.addEventListener('click', function () {
            fileInput.click();
        });

        fileInput.addEventListener('change', function () {
            if (this.files && this.files.length) {
                uploadSelectedFiles(this.files);
                this.value = '';
            }
        });

        ['dragenter', 'dragover'].forEach(function (evt) {
            dropzone.addEventListener(evt, function (e) {
                e.preventDefault(); e.stopPropagation();
                dropzone.classList.add('dragover');
            });
        });

        ['dragleave', 'drop'].forEach(function (evt) {
            dropzone.addEventListener(evt, function (e) {
                e.preventDefault(); e.stopPropagation();
                dropzone.classList.remove('dragover');
            });
        });

        dropzone.addEventListener('drop', function (e) {
            if (e.dataTransfer && e.dataTransfer.files && e.dataTransfer.files.length) {
                uploadSelectedFiles(e.dataTransfer.files);
            }
        });

        renderImagesGallery();
    }

    function uploadSelectedFiles(fileList) {
        if (!fileList || fileList.length === 0) return;

        var remainingSlots = 10 - currentProductImages.length;
        if (remainingSlots <= 0) {
            showToast('Maximum 10 images reached. Please remove an image before adding more.', 'error');
            return;
        }

        var filesToUpload = [];
        for (var i = 0; i < fileList.length; i++) {
            if (filesToUpload.length >= remainingSlots) break;
            var f = fileList[i];
            var ext = f.name.substring(f.name.lastIndexOf('.')).toLowerCase();
            if (['.jpg', '.jpeg', '.png', '.webp'].indexOf(ext) !== -1) {
                filesToUpload.push(f);
            }
        }

        if (filesToUpload.length === 0) {
            showToast('Please select valid image files (JPG, PNG, WEBP).', 'error');
            return;
        }

        if (fileList.length > remainingSlots) {
            showToast('Only first ' + remainingSlots + ' image(s) selected (limit is 10 max).', 'info');
        }

        var fd = new FormData();
        fd.append('action', 'admin_upload_product_images');
        for (var j = 0; j < filesToUpload.length; j++) {
            fd.append('file_' + j, filesToUpload[j]);
        }

        showToast('Uploading ' + filesToUpload.length + ' image(s)...', 'info');
        fetch('Api.ashx', { method: 'POST', body: fd })
            .then(function (r) { return r.json(); })
            .then(function (res) {
                if (res.success && res.files) {
                    res.files.forEach(function (url) {
                        if (currentProductImages.length < 10) {
                            currentProductImages.push(url);
                        }
                    });
                    renderImagesGallery();
                    showToast('Uploaded ' + res.files.length + ' image(s) successfully!', 'success');
                } else {
                    showToast(res.message || 'Image upload failed', 'error');
                }
            })
            .catch(function (err) {
                console.error(err);
                showToast('Error uploading images', 'error');
            });
    }

    function renderImagesGallery() {
        var gallery = document.getElementById('productImagesGallery');
        var countBadge = document.getElementById('imgUploadCount');
        if (!gallery) return;

        if (countBadge) {
            var c = currentProductImages.length;
            countBadge.innerText = c + ' / 10 images (Min: 1, Max: 10)';
            if (c === 0) {
                countBadge.style.background = '#fee2e2';
                countBadge.style.color = '#b91c1c';
            } else if (c >= 10) {
                countBadge.style.background = '#fef3c7';
                countBadge.style.color = '#b45309';
            } else {
                countBadge.style.background = '#d1fae5';
                countBadge.style.color = '#047857';
            }
        }

        if (currentProductImages.length === 0) {
            gallery.innerHTML = '<div style="grid-column:1/-1;font-size:12px;color:var(--text-muted);padding:8px 0;">No images uploaded yet. Please upload at least 1 image.</div>';
            return;
        }

        gallery.innerHTML = currentProductImages.map(function (url, idx) {
            var isPrimary = idx === 0;
            var displayUrl = getProductImgUrl(url);
            return '<div class="gallery-thumb-card' + (isPrimary ? ' is-primary' : '') + '">' +
                (isPrimary ? '<span class="gallery-thumb-primary-badge">Primary</span>' : '') +
                '<img src="' + escapeHtml(displayUrl) + '" class="gallery-thumb-img" alt="" onerror="this.onerror=null;this.src=\'images/sage_tee.jpg\'" />' +
                '<div class="gallery-thumb-actions">' +
                (!isPrimary ? '<button type="button" class="gallery-action-btn" title="Set as Primary" onclick="setPrimaryImage(' + idx + ')"><i class="fa-solid fa-star"></i></button>' : '') +
                '<button type="button" class="gallery-action-btn del" title="Delete image" onclick="removeProductImage(' + idx + ')"><i class="fa-solid fa-trash"></i></button>' +
                '</div>' +
                '</div>';
        }).join('');
    }

    window.setPrimaryImage = function (index) {
        if (index <= 0 || index >= currentProductImages.length) return;
        var selected = currentProductImages.splice(index, 1)[0];
        currentProductImages.unshift(selected);
        renderImagesGallery();
        showToast('Primary cover image updated', 'info');
    };

    window.removeProductImage = function (index) {
        if (index < 0 || index >= currentProductImages.length) return;
        currentProductImages.splice(index, 1);
        renderImagesGallery();
        showToast('Image removed', 'info');
    };

    function saveProduct() {
        var name = document.getElementById('pName').value.trim();
        var cat = document.getElementById('pCategory').value;
        var price = parseFloat(document.getElementById('pPrice').value);
        var errors = [];
        document.querySelectorAll('.form-input.error').forEach(function (e) { e.classList.remove('error'); });
        if (!name) { document.getElementById('pName').classList.add('error'); errors.push('Name is required.'); }
        if (!cat) { document.getElementById('pCategory').classList.add('error'); errors.push('Category is required.'); }
        if (isNaN(price) || price <= 0) { document.getElementById('pPrice').classList.add('error'); errors.push('Valid price required.'); }

        // STRICT IMAGE VALIDATION (Min 1, Max 10)
        if (currentProductImages.length < 1) {
            errors.push('Please upload at least 1 image for the product (Min: 1, Max: 10).');
        }
        if (currentProductImages.length > 10) {
            errors.push('Maximum 10 images allowed per product. Please delete excess images.');
        }

        if (errors.length) {
            var b = document.getElementById('productValBanner');
            b.innerHTML = '<strong>Fix errors:</strong><br/>' + errors.join('<br/>');
            b.classList.add('show'); return;
        }
        document.getElementById('productValBanner').classList.remove('show');
        var s = parseInt(document.getElementById('pStockS').value) || 0;
        var m = parseInt(document.getElementById('pStockM').value) || 0;
        var l = parseInt(document.getElementById('pStockL').value) || 0;
        var xl = parseInt(document.getElementById('pStockXL').value) || 0;
        var xxl = parseInt(document.getElementById('pStockXXL').value) || 0;

        var fd = new URLSearchParams();
        fd.append('action', 'admin_save_product');
        fd.append('id', editingId || 0);
        fd.append('name', name);
        fd.append('categoryName', cat);
        fd.append('price', price);
        fd.append('oldPrice', document.getElementById('pOldPrice').value || '');
        fd.append('sku', document.getElementById('pSku').value.trim());
        fd.append('desc', document.getElementById('pDesc').value.trim());
        fd.append('active', document.getElementById('pActive').value);
        fd.append('s', s);
        fd.append('m', m);
        fd.append('l', l);
        fd.append('xl', xl);
        fd.append('xxl', xxl);
        fd.append('images', JSON.stringify(currentProductImages));
        fd.append('image', currentProductImages[0] || 'images/sage_tee.jpg');

        fetch('Api.ashx', { method: 'POST', body: fd })
            .then(function (r) { return r.json(); })
            .then(function (res) {
                if (res.success) {
                    showToast(editingId ? 'Product updated with ' + currentProductImages.length + ' image(s)!' : 'Product added with ' + currentProductImages.length + ' image(s)!', 'success');
                    resetProductForm();
                    loadAdminData(function () {
                        switchNav('products');
                    });
                } else {
                    showToast(res.message || 'Error saving product', 'error');
                }
            });
    }

    function openDetails(id) {
        var p = DB.products.find(function (x) { return x.id === id; });
        if (!p) return;
        document.getElementById('dtlTitle').innerText = p.name;
        document.getElementById('dtlBody').innerHTML =
            '<img src="Images/' + escapeHtml(p.image) + '" style="width:100%;max-height:220px;object-fit:cover;border-radius:10px;margin-bottom:14px;" onerror="this.src=\'https://images.unsplash.com/photo-1521572267360-ee0c2909d518?w=300\'" />' +
            '<p style="font-size:13px;color:var(--text-muted);margin-bottom:8px;">' + escapeHtml(p.category) + ' &middot; ' + fmtINR(p.price) + ' &middot; SKU: ' + escapeHtml(p.sku || 'N/A') + '</p>' +
            '<p style="font-size:13.5px;color:var(--text-muted);line-height:1.6;margin-bottom:16px;">' + escapeHtml(p.desc || 'No description.') + '</p>' +
            '<div style="background:#f8fafc;border-radius:8px;padding:12px;margin-bottom:14px;"><div style="font-size:11px;font-weight:800;color:var(--text-muted);text-transform:uppercase;margin-bottom:8px;">Stock per size</div><div style="display:flex;gap:6px;flex-wrap:wrap;">' +
            '<span class="size-pill">S:' + p.s + '</span><span class="size-pill">M:' + p.m + '</span><span class="size-pill">L:' + p.l + '</span><span class="size-pill">XL:' + p.xl + '</span><span class="size-pill">XXL:' + p.xxl + '</span>' +
            '</div></div><div style="display:grid;grid-template-columns:1fr 1fr;gap:10px;">' +
            '<div style="background:#ecfdf5;border-radius:8px;padding:12px;text-align:center;"><div style="font-size:20px;font-weight:800;color:#047857;">' + p.sold + '</div><div style="font-size:11px;color:#047857;font-weight:600;">Units Sold</div></div>' +
            '<div style="background:#eff6ff;border-radius:8px;padding:12px;text-align:center;"><div style="font-size:20px;font-weight:800;color:#1d4ed8;">' + fmtINR(p.revenue) + '</div><div style="font-size:11px;color:#1d4ed8;font-weight:600;">Revenue</div></div>' +
            '</div>';
        document.getElementById('detailsModal').classList.add('open');
    }

    /* CATEGORIES */
    function renderCategories() {
        var map = {};
        DB.products.forEach(function (p) {
            if (!map[p.category]) map[p.category] = { count: 0, stock: 0, revenue: 0 };
            map[p.category].count++; map[p.category].stock += p.stock; map[p.category].revenue += p.revenue;
        });
        document.getElementById('categoriesGrid').innerHTML = Object.keys(map).map(function (k) {
            return '<div class="stat-card"><div class="stat-label">' + escapeHtml(k) + '</div><div class="stat-value">' + map[k].count + '</div><div class="stat-sub">' + map[k].stock + ' units</div><div style="margin-top:6px;font-size:11.5px;color:var(--text-muted);">Revenue: <strong style="color:#047857;">' + fmtINR(map[k].revenue) + '</strong></div></div>';
        }).join('');
    }

    /* INVENTORY */
    function renderStock() {
        var grid = document.getElementById('stockGrid');
        var lowOnly = document.getElementById('lowStockOnly').checked;
        var list = lowOnly ? DB.products.filter(function (p) { return p.stock <= 10; }) : DB.products;
        if (list.length === 0) { grid.innerHTML = '<div class="empty-msg" style="grid-column:1/-1;"><i class="fa-solid fa-warehouse"></i>No products match filter</div>'; return; }
        grid.innerHTML = list.map(function (p) {
            var cls = p.stock === 0 ? 'out' : (p.stock <= 5 ? 'low' : '');
            return '<div class="stock-card ' + cls + '"><div class="stock-card-top"><div><div class="stock-card-title">' + escapeHtml(p.name) + '</div><div class="stock-card-sub">' + fmtINR(p.price) + '</div></div><div class="stock-total-pill">' + p.stock + '</div></div><div style="display:flex;gap:4px;flex-wrap:wrap;">' +
                '<span class="size-pill">S:' + p.s + '</span><span class="size-pill">M:' + p.m + '</span><span class="size-pill">L:' + p.l + '</span><span class="size-pill">XL:' + p.xl + '</span><span class="size-pill">XXL:' + p.xxl + '</span></div>' +
                '<div class="stock-adjust"><select class="stock-size-sel" data-id="' + p.id + '"><option value="s">S</option><option value="m">M</option><option value="l">L</option><option value="xl">XL</option><option value="xxl">XXL</option></select><input type="number" class="stock-qty-input" data-id="' + p.id + '" value="1" min="1" /><button type="button" class="stock-btn-add" data-action="stock-add" data-id="' + p.id + '">+</button><button type="button" class="stock-btn-remove" data-action="stock-remove" data-id="' + p.id + '">−</button></div></div>';
        }).join('');
    }

    function adjustStock(id, op) {
        var sel = document.querySelector('.stock-size-sel[data-id="' + id + '"]');
        var qtyInput = document.querySelector('.stock-qty-input[data-id="' + id + '"]');
        if (!sel || !qtyInput) return;
        var qty = parseInt(qtyInput.value, 10);
        if (isNaN(qty) || qty <= 0) return;
        var size = sel.value;
        var delta = op === 'add' ? qty : -qty;

        var fd = new URLSearchParams();
        fd.append('action', 'admin_adjust_stock');
        fd.append('id', id);
        fd.append('size', size);
        fd.append('delta', delta);

        fetch('Api.ashx', { method: 'POST', body: fd })
            .then(function (r) { return r.json(); })
            .then(function (res) {
                if (res.success) {
                    showToast('Stock updated in database', 'success');
                    loadAdminData();
                }
            });
    }

    /* ORDERS */
    function renderOrders() {
        var tbody = document.getElementById('ordersBody');
        var term = (document.getElementById('orderSearch').value || '').toLowerCase();
        var st = document.getElementById('orderStatusFilter').value;
        var list = DB.orders.filter(function (o) {
            if (term && o.id.toLowerCase().indexOf(term) === -1 && o.customer_name.toLowerCase().indexOf(term) === -1 && o.user_email.toLowerCase().indexOf(term) === -1) return false;
            if (st && o.order_status !== st) return false;
            return true;
        });
        if (list.length === 0) { tbody.innerHTML = '<tr><td colspan="6"><div class="empty-msg"><i class="fa-solid fa-inbox"></i>No orders found</div></td></tr>'; return; }
        tbody.innerHTML = list.map(function (o) {
            var payColor = (o.payment_status === 'Paid') ? '#047857' : ((o.payment_status === 'Completed') ? '#10b981' : '#b45309');
            return '<tr><td class="id-cell">#' + escapeHtml(o.id) + '</td><td><div class="cust-name">' + escapeHtml(o.customer_name) + '</div><div class="cust-sub">' + escapeHtml(o.user_email) + '</div></td><td class="price-cell">' + fmtINR(o.total_amount) + '<div style="font-size:10.5px;color:var(--text-muted);margin-top:2px;">' + escapeHtml(o.payment_method || 'Online') + ' &bull; <strong style="color:' + payColor + '">' + escapeHtml(o.payment_status || 'Pending') + '</strong></div></td><td>' + badgeForStatus(o.order_status) + '</td><td style="color:var(--text-muted);font-size:12px;">' + escapeHtml(o.date_formatted) + '</td><td><button class="icon-action-btn" data-action="view-order" data-id="' + o.id + '"><i class="fa-solid fa-eye"></i></button><button class="icon-action-btn" data-action="print-order" data-id="' + o.id + '"><i class="fa-solid fa-print"></i></button><select class="form-input" style="padding:6px 8px;font-size:12px;width:auto;" data-action="order-status" data-id="' + o.id + '">' + orderOptions(o.order_status) + '</select></td></tr>';
        }).join('');
    }

    function updateOrderStatus(id, newStatus) {
        var fd = new URLSearchParams();
        fd.append('action', 'admin_update_order_status');
        fd.append('orderId', id);
        fd.append('status', newStatus);

        fetch('Api.ashx', { method: 'POST', body: fd })
            .then(function (r) { return r.json(); })
            .then(function (res) {
                if (res.success) {
                    showToast('Order #' + id + ' status updated to ' + newStatus, 'success');
                    loadAdminData();
                }
            });
    }

    /* RETURNS */
    function renderReturns() {
        var tbody = document.getElementById('returnsBody');
        if (DB.returns.length === 0) { tbody.innerHTML = '<tr><td colspan="6"><div class="empty-msg"><i class="fa-solid fa-rotate-left"></i>No return requests</div></td></tr>'; return; }
        tbody.innerHTML = DB.returns.map(function (r) {
            var btns = '';
            if (r.status === 'Pending') btns = '<button class="btn btn-sm" data-action="return-approve" data-id="' + r.id + '"><i class="fa-solid fa-check"></i></button> <button class="btn btn-sm btn-danger" data-action="return-reject" data-id="' + r.id + '"><i class="fa-solid fa-xmark"></i></button>';
            else if (r.status === 'Approved') btns = '<button class="btn btn-sm btn-warn" data-action="return-refund" data-id="' + r.id + '"><i class="fa-solid fa-rotate-left"></i> Refund</button>';
            else btns = '<span style="color:var(--text-muted);font-size:12px;">Done</span>';
            return '<tr><td class="id-cell">#' + escapeHtml(r.id) + '</td><td>#' + escapeHtml(r.order) + '</td><td class="cust-name">' + escapeHtml(r.customer) + '</td><td style="color:#be185d;font-size:12.5px;">' + escapeHtml(r.reason) + '</td><td>' + badgeForStatus(r.status) + '</td><td>' + btns + '</td></tr>';
        }).join('');
    }
    function updateReturnStatus(id, newStatus) {
        var fd = new URLSearchParams();
        fd.append('action', 'admin_update_return_status');
        fd.append('returnId', id);
        fd.append('status', newStatus);

        fetch('Api.ashx', { method: 'POST', body: fd })
            .then(function (r) { return r.json(); })
            .then(function (res) {
                if (res.success) {
                    showToast('Return #' + id + ' → ' + newStatus, 'success');
                    loadAdminData();
                } else {
                    showToast(res.message || 'Error updating return', 'danger');
                }
            })
            .catch(function () {
                showToast('Network error updating return', 'danger');
            });
    }

    /* CUSTOMERS */
    function renderCustomers() {
        var tbody = document.getElementById('customersBody');
        var term = (document.getElementById('customerSearch').value || '').toLowerCase();
        var list = DB.customers.filter(function (c) {
            if (term && c.name.toLowerCase().indexOf(term) === -1 && c.email.toLowerCase().indexOf(term) === -1 && c.city.toLowerCase().indexOf(term) === -1) return false;
            return true;
        });
        if (list.length === 0) { tbody.innerHTML = '<tr><td colspan="7"><div class="empty-msg"><i class="fa-solid fa-users"></i>No customers</div></td></tr>'; return; }
        tbody.innerHTML = list.map(function (c) {
            var isVip = c.spent >= 10000;
            return '<tr><td class="id-cell">' + escapeHtml(c.user_id) + '</td><td class="cust-name">' + escapeHtml(c.name) + ' ' + (isVip ? '<span class="badge vip"><i class="fa-solid fa-crown"></i> VIP</span>' : '') + '</td><td>' + escapeHtml(c.email) + '</td><td>' + escapeHtml(c.phone) + '</td><td>' + escapeHtml(c.city) + '</td><td><strong>' + c.order_count + '</strong></td><td style="color:var(--text-muted);font-size:12px;">' + escapeHtml(c.date_formatted) + '</td></tr>';
        }).join('');
    }

    /* REVIEWS */
    function renderReviews() {
        var tbody = document.getElementById('reviewsBody');
        if (DB.reviews.length === 0) { tbody.innerHTML = '<tr><td colspan="6"><div class="empty-msg"><i class="fa-regular fa-star"></i>No reviews</div></td></tr>'; return; }
        tbody.innerHTML = DB.reviews.map(function (r) {
            return '<tr><td class="cust-name">' + escapeHtml(r.product_name) + '</td><td>' + escapeHtml(r.customer) + '</td><td style="color:#f59e0b;font-weight:800;">★ ' + r.rating.toFixed(1) + '</td><td style="max-width:260px;font-size:12.5px;">' + escapeHtml(r.comment) + '</td><td style="color:var(--text-muted);font-size:12px;">' + escapeHtml(r.date_formatted) + '</td><td><button class="btn btn-danger btn-sm" data-action="delete-review" data-id="' + r.id + '"><i class="fa-solid fa-trash"></i></button></td></tr>';
        }).join('');
    }
    function deleteReview(id) {
        if (!confirm('Delete review?')) return;
        var fd = new URLSearchParams();
        fd.append('action', 'admin_delete_review');
        fd.append('id', id);
        fetch('Api.ashx', { method: 'POST', body: fd })
            .then(function (r) { return r.json(); })
            .then(function (res) {
                if (res.success) {
                    showToast('Review deleted from database', 'success');
                    loadAdminData();
                }
            });
    }

    /* COUPONS */
    function renderCoupons() {
        var tbody = document.getElementById('couponsBody');
        if (DB.coupons.length === 0) { tbody.innerHTML = '<tr><td colspan="6"><div class="empty-msg"><i class="fa-solid fa-ticket"></i>No coupons</div></td></tr>'; return; }
        var now = new Date();
        tbody.innerHTML = DB.coupons.map(function (c) {
            var isExpired = false;
            try { if (c.expiry && c.expiry !== '—') isExpired = new Date(c.expiry) < now; } catch (e) { }
            var sb = isExpired ? '<span class="badge expired">Expired</span>' : '<span class="badge active">' + escapeHtml(c.status) + '</span>';
            return '<tr><td class="id-cell">' + escapeHtml(c.code) + ' <button class="icon-action-btn" data-action="copy-coupon" data-id="' + c.id + '"><i class="fa-solid fa-copy"></i></button></td><td><strong>' + escapeHtml(c.display) + '</strong></td><td>' + fmtINR(c.min) + '</td><td style="color:var(--text-muted);">' + escapeHtml(c.expiry) + '</td><td>' + sb + '</td><td><button class="btn btn-danger btn-sm" data-action="delete-coupon" data-id="' + c.id + '"><i class="fa-solid fa-trash"></i></button></td></tr>';
        }).join('');
    }
    function addCoupon() {
        var code = document.getElementById('cCode').value.trim();
        var value = parseFloat(document.getElementById('cValue').value);
        if (!code || isNaN(value) || value <= 0) { showToast('Fill code and value', 'error'); return; }
        var type = document.getElementById('cType').value;
        var min = parseFloat(document.getElementById('cMin').value) || 0;

        var fd = new URLSearchParams();
        fd.append('action', 'admin_add_coupon');
        fd.append('code', code);
        fd.append('type', type);
        fd.append('value', value);
        fd.append('min', min);

        fetch('Api.ashx', { method: 'POST', body: fd })
            .then(function (r) { return r.json(); })
            .then(function (res) {
                if (res.success) {
                    showToast('Coupon added to database', 'success');
                    document.getElementById('cCode').value = '';
                    document.getElementById('cValue').value = '';
                    document.getElementById('cMin').value = '0';
                    loadAdminData();
                }
            });
    }
    function deleteCoupon(id) {
        if (!confirm('Delete coupon?')) return;
        var fd = new URLSearchParams();
        fd.append('action', 'admin_delete_coupon');
        fd.append('id', id);
        fetch('Api.ashx', { method: 'POST', body: fd })
            .then(function (r) { return r.json(); })
            .then(function (res) {
                if (res.success) {
                    showToast('Coupon deleted', 'success');
                    loadAdminData();
                }
            });
    }

    /* NOTIFICATIONS */
    function renderNotifications() {
        var list = document.getElementById('notificationsList');
        if (DB.notifications.length === 0) { list.innerHTML = '<div class="empty-msg"><i class="fa-regular fa-bell"></i>All caught up!</div>'; document.getElementById('sbNotifBadge').style.display = 'none'; return; }
        document.getElementById('sbNotifBadge').style.display = '';
        document.getElementById('sbNotifBadge').innerText = DB.notifications.length;
        list.innerHTML = DB.notifications.map(function (n) {
            var color = n.tone === 'warn' ? '#b45309' : (n.tone === 'success' ? '#047857' : '#1d4ed8');
            var bg = n.tone === 'warn' ? '#fef3c7' : (n.tone === 'success' ? '#d1fae5' : '#dbeafe');
            return '<div style="display:flex;gap:14px;padding:16px;border-radius:12px;background:#f8fafc;margin-bottom:12px;align-items:flex-start;border:1px solid #eef2f5;">' +
                '<div style="width:40px;height:40px;border-radius:50%;background:' + bg + ';color:' + color + ';display:grid;place-items:center;flex-shrink:0;font-size:16px;"><i class="fa-solid ' + n.icon + '"></i></div>' +
                '<div style="flex:1;"><div style="font-weight:800;font-size:14px;margin-bottom:2px;">' + escapeHtml(n.title) + '</div><div style="font-size:13px;color:var(--text-muted);line-height:1.5;">' + escapeHtml(n.body) + '</div><div style="font-size:11.5px;color:var(--text-light);margin-top:6px;font-weight:600;"><i class="fa-regular fa-clock"></i> ' + escapeHtml(n.time) + '</div></div>' +
                '<button class="icon-action-btn" data-action="dismiss-notif" data-id="' + n.id + '"><i class="fa-solid fa-xmark"></i></button></div>';
        }).join('');
    }

    /* ACTIVITY */
    function renderActivity() {
        var tbody = document.getElementById('activityTableBody');
        var filter = document.getElementById('activityFilter').value;
        var list = filter ? DB.activity.filter(function (a) { return a.type === filter; }) : DB.activity;
        if (list.length === 0) { tbody.innerHTML = '<tr><td colspan="3"><div class="empty-msg"><i class="fa-solid fa-list-check"></i>No activity</div></td></tr>'; return; }
        tbody.innerHTML = list.map(function (a) {
            return '<tr><td>' + escapeHtml(a.title) + '<br/><span style="color:var(--text-muted);font-size:11.5px;">' + escapeHtml(a.body) + '</span></td><td>' + escapeHtml(a.user || 'admin') + '</td><td style="color:var(--text-muted);font-size:12px;">' + escapeHtml(a.time) + '</td></tr>';
        }).join('');
    }

    /* GLOBAL SEARCH */
    function handleGlobalSearch(q) {
        var dropdown = document.getElementById('searchDropdown');
        if (!q.trim()) { dropdown.classList.remove('show'); return; }
        q = q.toLowerCase();
        var results = [];
        DB.products.forEach(function (p) { if (p.name.toLowerCase().indexOf(q) > -1) results.push({ type: 'product', label: p.name, icon: 'fa-box' }); });
        DB.orders.forEach(function (o) { if (o.id.toLowerCase().indexOf(q) > -1 || o.customer_name.toLowerCase().indexOf(q) > -1) results.push({ type: 'order', label: '#' + o.id + ' — ' + o.customer_name, icon: 'fa-cart-shopping' }); });
        DB.customers.forEach(function (c) { if (c.name.toLowerCase().indexOf(q) > -1 || c.email.toLowerCase().indexOf(q) > -1) results.push({ type: 'customer', label: c.name + ' — ' + c.email, icon: 'fa-user' }); });
        if (results.length === 0) dropdown.innerHTML = '<div class="search-result-item" style="color:var(--text-light);">No results</div>';
        else dropdown.innerHTML = results.slice(0, 8).map(function (r) { return '<div class="search-result-item" data-navigate="' + (r.type === 'product' ? 'products' : (r.type === 'order' ? 'orders' : 'customers')) + '"><i class="fa-solid ' + r.icon + '"></i> ' + escapeHtml(r.label) + '</div>'; }).join('');
        dropdown.classList.add('show');
    }

    /* EXPORT */
    function exportCSV(data, filename) {
        if (!data.length) return;
        var csv = Object.keys(data[0]).join(',') + '\n';
        data.forEach(function (row) { csv += Object.values(row).map(function (v) { return '"' + String(v).replace(/"/g, '""') + '"'; }).join(',') + '\n'; });
        var blob = new Blob([csv], { type: 'text/csv' });
        var url = URL.createObjectURL(blob);
        var a = document.createElement('a'); a.href = url; a.download = filename; a.click();
        URL.revokeObjectURL(url);
        showToast('Exported ' + filename, 'success');
    }

    /* REVEAL ON SCROLL */
    function applyReveal() {
        var reveals = document.querySelectorAll('.reveal');
        reveals.forEach(function (el) {
            if (el.getBoundingClientRect().top < window.innerHeight - 40) el.classList.add('in');
        });
    }

    /* RIPPLE */
    function attachRipple(el) {
        el.addEventListener('click', function (e) {
            var rect = el.getBoundingClientRect();
            var size = Math.max(rect.width, rect.height);
            var x = e.clientX - rect.left - size / 2;
            var y = e.clientY - rect.top - size / 2;
            var ripple = document.createElement('span');
            ripple.className = 'ripple';
            ripple.style.width = ripple.style.height = size + 'px';
            ripple.style.left = x + 'px'; ripple.style.top = y + 'px';
            el.appendChild(ripple);
            setTimeout(function () { ripple.remove(); }, 600);
        });
    }

    /* ================== EVENT BINDINGS ================== */
    document.addEventListener('DOMContentLoaded', function () {
        // Sidebar collapse
        document.getElementById('sbCollapseBtn').addEventListener('click', function (e) {
            e.stopPropagation();
            var sb = document.getElementById('adminSidebar');
            var main = document.getElementById('adminMain');
            var fab = document.getElementById('scrollTopFab');
            sb.classList.toggle('collapsed');
            main.classList.toggle('sidebar-collapsed');
            fab.classList.toggle('sidebar-collapsed', sb.classList.contains('collapsed'));
        });

        // Section collapse
        document.querySelectorAll('.sb-section-head').forEach(function (head) {
            head.addEventListener('click', function () {
                var section = this.closest('.sb-section');
                if (document.getElementById('adminSidebar').classList.contains('collapsed')) return;
                section.classList.toggle('collapsed');
            });
        });

        // Sidebar items - ripple + nav
        document.querySelectorAll('.sb-item').forEach(function (item) {
            attachRipple(item);
            item.addEventListener('click', function () {
                var v = this.getAttribute('data-view');
                if (v) switchNav(v);
            });
        });

        // Live clock
        startClock();

        // Scroll reveal + FAB
        window.addEventListener('scroll', function () {
            applyReveal();
            var fab = document.getElementById('scrollTopFab');
            if (window.scrollY > 300) fab.classList.add('show'); else fab.classList.remove('show');
        });
        document.getElementById('scrollTopFab').addEventListener('click', function () {
            window.scrollTo({ top: 0, behavior: 'smooth' });
        });

        // Save product
        document.getElementById('btnSaveProduct').addEventListener('click', saveProduct);
        document.getElementById('btnCancelEdit').addEventListener('click', function () { resetProductForm(); switchNav('products'); });
        document.getElementById('btnAddCoupon').addEventListener('click', addCoupon);
        document.getElementById('btnSaveSettings').addEventListener('click', function () { showToast('Settings saved', 'success'); });
        document.getElementById('btnCloseModal').addEventListener('click', function () { document.getElementById('detailsModal').classList.remove('open'); });
        document.getElementById('topbarBell').addEventListener('click', function () {
            this.classList.add('shake');
            setTimeout(function () { document.getElementById('topbarBell').classList.remove('shake'); }, 600);
            switchNav('notifications');
        });
        document.getElementById('mobileMenuBtn').addEventListener('click', function () { document.getElementById('adminSidebar').classList.toggle('open'); });

        // Theme toggle
        document.getElementById('themeToggle').addEventListener('click', function () {
            var html = document.documentElement;
            var isDark = html.getAttribute('data-theme') === 'dark';
            if (isDark) { html.removeAttribute('data-theme'); this.innerHTML = '<i class="fa-solid fa-moon"></i>'; }
            else { html.setAttribute('data-theme', 'dark'); this.innerHTML = '<i class="fa-solid fa-sun"></i>'; }
        });

        // Search
        var searchTimeout;
        document.getElementById('globalSearch').addEventListener('input', function () {
            clearTimeout(searchTimeout);
            var q = this.value;
            searchTimeout = setTimeout(function () { handleGlobalSearch(q); }, 200);
        });
        document.getElementById('globalSearch').addEventListener('blur', function () { setTimeout(function () { document.getElementById('searchDropdown').classList.remove('show'); }, 200); });

        // Recent views
        document.getElementById('recentViewsBtn').addEventListener('click', function (e) {
            e.stopPropagation();
            document.getElementById('recentViewsDropdown').classList.toggle('show');
        });

        // Profile dropdown
        document.getElementById('topbarProfile').addEventListener('click', function (e) {
            e.stopPropagation();
            document.getElementById('profileDropdown').classList.toggle('show');
        });
        document.body.addEventListener('click', function () {
            document.getElementById('profileDropdown').classList.remove('show');
            document.getElementById('recentViewsDropdown').classList.remove('show');
        });

        // Filters
        document.getElementById('productSearch').addEventListener('input', renderProductsGrid);
        document.getElementById('productCategoryFilter').addEventListener('change', renderProductsGrid);
        document.getElementById('productSort').addEventListener('change', renderProductsGrid);
        document.getElementById('orderSearch').addEventListener('input', renderOrders);
        document.getElementById('orderStatusFilter').addEventListener('change', renderOrders);
        document.getElementById('customerSearch').addEventListener('input', renderCustomers);
        document.getElementById('lowStockOnly').addEventListener('change', renderStock);
        document.getElementById('activityFilter').addEventListener('change', renderActivity);

        // Initialize multi-image uploader (1 to 10 photos)
        initImageUploader();

        // Export
        document.getElementById('btnExportProducts').addEventListener('click', function () {
            exportCSV(DB.products.map(function (p) { return { ID: p.id, SKU: p.sku, Name: p.name, Category: p.category, Price: p.price, Stock: p.stock }; }), 'products.csv');
        });
        document.getElementById('btnExportOrders').addEventListener('click', function () {
            exportCSV(DB.orders, 'orders.csv');
        });
        document.getElementById('btnPrintOrders').addEventListener('click', function () { window.print(); });

        // View toggle
        document.getElementById('btnToggleView').addEventListener('click', function () {
            currentProductView = currentProductView === 'grid' ? 'list' : 'grid';
            this.innerHTML = currentProductView === 'grid' ? '<i class="fa-solid fa-list"></i> List View' : '<i class="fa-solid fa-th"></i> Grid View';
            renderProductsGrid();
        });

        // Mark all read
        document.getElementById('btnMarkAllRead').addEventListener('click', function () {
            DB.notifications = [];
            renderNotifications();
            showToast('All notifications marked read', 'success');
        });

        // Settings tabs
        document.querySelectorAll('[data-settings-tab]').forEach(function (btn) {
            btn.addEventListener('click', function () {
                document.querySelectorAll('[data-settings-tab]').forEach(function (b) { b.classList.remove('active'); });
                document.querySelectorAll('[data-settings-content]').forEach(function (c) { c.classList.remove('active'); });
                this.classList.add('active');
                document.querySelector('[data-settings-content="' + this.getAttribute('data-settings-tab') + '"]').classList.add('active');
            });
        });

        // Keyboard
        document.addEventListener('keydown', function (e) {
            if ((e.ctrlKey || e.metaKey) && e.key === 'k') { e.preventDefault(); document.getElementById('globalSearch').focus(); }
            if (e.key === 'Escape') {
                document.getElementById('detailsModal').classList.remove('open');
                document.getElementById('searchDropdown').classList.remove('show');
                document.getElementById('profileDropdown').classList.remove('show');
                document.getElementById('recentViewsDropdown').classList.remove('show');
            }
        });

        // MAIN DELEGATION
        document.body.addEventListener('click', function (e) {
            if (e.target.classList.contains('product-checkbox')) {
                var id = parseInt(e.target.getAttribute('data-id'), 10);
                if (e.target.checked) selectedProducts.add(id); else selectedProducts.delete(id);
                e.target.closest('.product-card').classList.toggle('selected', e.target.checked);
                updateBulkToolbar();
                return;
            }

            var target = e.target.closest('[data-action]');
            var navTarget = e.target.closest('[data-navigate]');

            if (navTarget) {
                switchNav(navTarget.getAttribute('data-navigate'));
                return;
            }

            if (!target) return;
            var action = target.getAttribute('data-action');
            var id = target.getAttribute('data-id');

            if (action === 'view') openDetails(parseInt(id, 10));
            if (action === 'edit') editProduct(parseInt(id, 10));
            if (action === 'delete') deleteProduct(parseInt(id, 10));
            if (action === 'duplicate') duplicateProduct(parseInt(id, 10));
            if (action === 'stock-add') adjustStock(parseInt(id, 10), 'add');
            if (action === 'stock-remove') adjustStock(parseInt(id, 10), 'remove');
            if (action === 'delete-review') deleteReview(parseInt(id, 10));
            if (action === 'delete-coupon') deleteCoupon(parseInt(id, 10));
            if (action === 'copy-coupon') {
                var c = DB.coupons.find(function (x) { return x.id === parseInt(id, 10); });
                if (c) { navigator.clipboard.writeText(c.code); showToast('Copied: ' + c.code, 'info'); }
            }
            if (action === 'return-approve') updateReturnStatus(id, 'Approved');
            if (action === 'return-reject') updateReturnStatus(id, 'Rejected');
            if (action === 'return-refund') updateReturnStatus(id, 'Refunded');
            if (action === 'dismiss-notif') { DB.notifications = DB.notifications.filter(function (n) { return n.id !== parseInt(id, 10); }); renderNotifications(); showToast('Dismissed', 'info'); }
            if (action === 'view-order') {
                var o = DB.orders.find(function (x) { return x.id === id; });
                if (o) {
                    var payBadge = '<span style="font-weight:700;color:' + (o.payment_status === 'Paid' ? '#047857' : '#b45309') + '">' + escapeHtml(o.payment_status || 'Pending') + '</span>';
                    document.getElementById('dtlTitle').innerText = 'Order #' + id;
                    document.getElementById('dtlBody').innerHTML = '<div style="line-height:2;font-size:13.5px;">' +
                        '<strong>Customer:</strong> ' + escapeHtml(o.customer_name) + '<br/>' +
                        '<strong>Email:</strong> ' + escapeHtml(o.user_email) + '<br/>' +
                        (o.user_phone ? ('<strong>Phone:</strong> ' + escapeHtml(o.user_phone) + '<br/>') : '') +
                        (o.city ? ('<strong>City:</strong> ' + escapeHtml(o.city) + '<br/>') : '') +
                        '<strong>Total Amount:</strong> ' + fmtINR(o.total_amount) + '<br/>' +
                        '<strong>Payment Method:</strong> ' + escapeHtml(o.payment_method || 'Online') + ' (' + payBadge + ')<br/>' +
                        (o.notes ? ('<strong>Order Notes / Payment Ref:</strong> <span style="font-family:monospace;background:#f1f5f9;padding:2px 6px;border-radius:4px;">' + escapeHtml(o.notes) + '</span><br/>') : '') +
                        '<strong>Order Status:</strong> ' + badgeForStatus(o.order_status) + '<br/>' +
                        '<strong>Order Date:</strong> ' + escapeHtml(o.date_formatted) + '</div>';
                    document.getElementById('detailsModal').classList.add('open');
                }
            }
            if (action === 'print-order') { showToast('Print dialog opening...', 'info'); setTimeout(function () { window.print(); }, 300); }
            if (action === 'help') { document.getElementById('dtlTitle').innerText = 'Help & Documentation'; document.getElementById('dtlBody').innerHTML = '<div style="line-height:2;font-size:13.5px;"><strong>Keyboard Shortcuts:</strong><br/>Ctrl+K — Focus search<br/>Esc — Close modals<br/><br/><strong>Quick Tips:</strong><br/>• Use the search bar to find products, orders, or customers<br/>• Click the checkbox on product cards to bulk-select<br/>• Collapse sidebar via the chevron button<br/>• Toggle dark mode from the moon icon</div>'; document.getElementById('detailsModal').classList.add('open'); }
            if (action === 'reseed') { if (confirm('Reset all data to sample values?')) location.reload(); }
            if (action === 'bulk-delete') {
                if (selectedProducts.size === 0) return;
                if (!confirm('Delete ' + selectedProducts.size + ' product(s)?')) return;
                DB.products = DB.products.filter(function (p) { return !selectedProducts.has(p.id); });
                selectedProducts.clear();
                renderProductsGrid(); renderStock(); renderDashboard();
                showToast('Products deleted', 'success');
            }
            if (action === 'bulk-activate') {
                DB.products.forEach(function (p) { if (selectedProducts.has(p.id)) p.active = 1; });
                renderProductsGrid(); showToast('Activated', 'success');
            }
            if (action === 'bulk-deactivate') {
                DB.products.forEach(function (p) { if (selectedProducts.has(p.id)) p.active = 0; });
                renderProductsGrid(); showToast('Deactivated', 'success');
            }
            if (action === 'return-approve') { updateReturnStatus(target.getAttribute('data-id'), 'Approved'); }
            if (action === 'return-reject') { updateReturnStatus(target.getAttribute('data-id'), 'Rejected'); }
            if (action === 'return-refund') { updateReturnStatus(target.getAttribute('data-id'), 'Refunded'); }
            if (action === 'profile') { showToast('Profile page would open', 'info'); }
            if (action === 'add-collection') { showToast('New collection form would open', 'info'); }
            if (action === 'new-campaign') { showToast('New campaign form would open', 'info'); }
        });

        // Change delegation
        document.body.addEventListener('change', function (e) {
            var target = e.target;
            if (target.tagName === 'SELECT' && target.getAttribute('data-action') === 'order-status') {
                updateOrderStatus(target.getAttribute('data-id'), target.value);
            }
        });

        // Init and Load Live Database
        loadAdminData();
        renderRecentViews();
        setTimeout(applyReveal, 200);
    });

    function loadAdminData(callback) {
        fetch('Api.ashx?action=admin_get_data')
            .then(function (r) { return r.json(); })
            .then(function (res) {
                if (res.success) {
                    DB.products = res.products || [];
                    DB.categories = res.categories || [];
                    DB.orders = res.orders || [];
                    DB.customers = res.customers || [];
                    DB.reviews = res.reviews || [];
                    DB.coupons = res.coupons || [];
                    DB.activity = res.activity || [];
                    DB.returns = res.returns || [];
                    DB.stats = res.stats || null;
                    DB.analytics = res.analytics || null;

                    // Populate category dropdown in Add/Edit Product form
                    var catSelect = document.getElementById('pCategory');
                    if (catSelect && DB.categories.length) {
                        var curVal = catSelect.value;
                        catSelect.innerHTML = '<option value="">Select Category</option>' +
                            DB.categories.map(function (c) {
                                return '<option value="' + escapeHtml(c.name) + '">' + escapeHtml(c.name) + '</option>';
                            }).join('');
                        if (curVal) catSelect.value = curVal;
                    }

                    // Populate product category filter
                    var catFilter = document.getElementById('productCategoryFilter');
                    if (catFilter && DB.categories.length) {
                        var curFilt = catFilter.value;
                        catFilter.innerHTML = '<option value="">All Categories</option>' +
                            DB.categories.map(function (c) {
                                return '<option value="' + escapeHtml(c.name) + '">' + escapeHtml(c.name) + '</option>';
                            }).join('');
                        if (curFilt) catFilter.value = curFilt;
                    }

                    renderDashboard();
                    renderProductsGrid();
                    renderStock();
                    document.getElementById('sbNotifBadge').innerText = DB.notifications ? DB.notifications.length : 0;
                    if (callback) callback();
                }
            })
            .catch(function (err) {
                console.error('Failed to load admin data:', err);
                renderView('dashboard');
            });
    }
</script>
    </form>
</body>
</html>