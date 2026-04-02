<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Study Hub</title>
<link href="https://fonts.googleapis.com/css2?family=Instrument+Serif:ital@0;1&family=DM+Sans:opsz,wght@9..40,300;9..40,400;9..40,500;9..40,600&display=swap" rel="stylesheet">
<style>
:root {
  --bg:#f7f6f2;--surface:#fff;--surface2:#f0ede6;--border:#e8e4db;--border2:#d4cfc4;
  --text:#1c1b18;--text2:#6b6760;--text3:#a09c94;--radius:14px;--radius-sm:9px;
  --shadow:0 1px 2px rgba(0,0,0,.05),0 4px 14px rgba(0,0,0,.05);
  --shadow-md:0 2px 6px rgba(0,0,0,.07),0 10px 30px rgba(0,0,0,.08);
  --serif:'Instrument Serif',Georgia,serif;--sans:'DM Sans',system-ui,sans-serif;
  --eu:#2d5a9e;--eu-l:#e8eef8;--eu-m:#b5d0f0;
  --micro:#1a7a5e;--micro-l:#e4f4ef;--micro-m:#9fddcc;
  --macro:#8a5c00;--macro-l:#fdf3d9;--macro-m:#f5cc6e;
  --ibt:#7a2d6e;--ibt-l:#f6eaf4;--ibt-m:#dcb0d6;
  --ic:#9c3520;--ic-l:#fdeee9;--ic-m:#f5b8a8;
  --green:#1a7a5e;--green-l:#e4f4ef;--red:#9c3520;--red-l:#fdeee9;
  --amber:#8a5c00;--amber-l:#fdf3d9;
}
*{box-sizing:border-box;margin:0;padding:0}html{scroll-behavior:smooth}
body{font-family:var(--sans);background:var(--bg);color:var(--text);min-height:100vh;font-size:15px;line-height:1.6}
.shell{display:flex;min-height:100vh}

/* ── Sidebar ── */
.sidebar{width:240px;flex-shrink:0;background:var(--surface);border-right:1px solid var(--border);display:flex;flex-direction:column;position:sticky;top:0;height:100vh;overflow-y:auto}
.logo{padding:24px 20px 20px;border-bottom:1px solid var(--border)}
.logo-title{font-family:var(--serif);font-size:20px;line-height:1.2}
.logo-sub{font-size:11px;color:var(--text3);letter-spacing:.05em;text-transform:uppercase;margin-top:3px}
.nav{padding:16px 12px;flex:1}
.nav-label{font-size:10px;font-weight:600;letter-spacing:.09em;text-transform:uppercase;color:var(--text3);padding:0 8px;margin:12px 0 4px}
.nav-label:first-child{margin-top:0}
.nav-btn{display:flex;align-items:center;gap:10px;width:100%;padding:8px 10px;border-radius:var(--radius-sm);border:none;background:none;cursor:pointer;font-family:var(--sans);font-size:13.5px;color:var(--text2);text-align:left;transition:all .15s}
.nav-btn:hover{background:var(--surface2);color:var(--text)}
.nav-btn.active{background:var(--eu-l);color:var(--eu);font-weight:500}
.nav-btn.active[data-color="micro"]{background:var(--micro-l);color:var(--micro)}
.nav-btn.active[data-color="macro"]{background:var(--macro-l);color:var(--macro)}
.nav-btn.active[data-color="ibt"]{background:var(--ibt-l);color:var(--ibt)}
.nav-btn.active[data-color="ic"]{background:var(--ic-l);color:var(--ic)}
.nav-dot{width:8px;height:8px;border-radius:50%;flex-shrink:0}
.nav-sub{display:flex;align-items:center;gap:10px;width:100%;padding:6px 10px 6px 28px;border-radius:var(--radius-sm);border:none;background:none;cursor:pointer;font-family:var(--sans);font-size:12.5px;color:var(--text3);text-align:left;transition:all .15s}
.nav-sub:hover{background:var(--surface2);color:var(--text2)}
.nav-sub.active{color:var(--text);font-weight:500}

/* ── Main ── */
.main{flex:1;overflow-y:auto}
.page{display:none;padding:44px 52px;max-width:920px}
.page.active{display:block}

/* ── Dashboard ── */
.dash-grid{display:grid;grid-template-columns:1fr 1fr;gap:16px;margin-top:8px}
.subject-card{background:var(--surface);border:1px solid var(--border);border-radius:var(--radius);padding:22px 24px;box-shadow:var(--shadow);cursor:pointer;transition:all .2s;position:relative;overflow:hidden}
.subject-card::before{content:'';position:absolute;top:0;left:0;right:0;height:3px}
.subject-card:hover{box-shadow:var(--shadow-md);transform:translateY(-2px)}
.sc-eu::before{background:var(--eu)}.sc-micro::before{background:var(--micro)}
.sc-macro::before{background:var(--macro)}.sc-ibt::before{background:var(--ibt)}.sc-ic::before{background:var(--ic)}
.sc-name{font-family:var(--serif);font-size:19px;margin-bottom:4px}
.sc-meta{font-size:12px;color:var(--text3);margin-bottom:14px}
.sc-progress{height:4px;background:var(--border);border-radius:2px;margin-bottom:8px;overflow:hidden}
.sc-progress-fill{height:100%;border-radius:2px}
.sc-stats{display:flex;gap:16px}
.sc-stat{font-size:12px;color:var(--text3)}
.sc-stat strong{color:var(--text2);font-weight:600}

/* ── Page headers ── */
.page-eyebrow{font-size:11px;font-weight:600;letter-spacing:.08em;text-transform:uppercase;color:var(--text3);margin-bottom:6px}
.page-title{font-family:var(--serif);font-size:36px;line-height:1.15;margin-bottom:8px}
.page-desc{font-size:14px;color:var(--text2);margin-bottom:32px}

/* ── Lecture list ── */
.lectures-list{display:flex;flex-direction:column;gap:10px}
.lec-card{background:var(--surface);border:1px solid var(--border);border-radius:var(--radius);padding:18px 22px;box-shadow:var(--shadow);display:flex;align-items:center;gap:16px;cursor:pointer;transition:all .2s}
.lec-card:hover{box-shadow:var(--shadow-md);border-color:var(--border2)}
.lec-card.empty{opacity:.45;cursor:default}.lec-card.empty:hover{box-shadow:var(--shadow);border-color:var(--border)}
.lec-num{width:40px;height:40px;border-radius:10px;display:flex;align-items:center;justify-content:center;font-size:13px;font-weight:600;flex-shrink:0}
.lec-info{flex:1}.lec-title{font-size:14px;font-weight:500;color:var(--text)}.lec-sub{font-size:12px;color:var(--text3);margin-top:1px}
.lec-badges{display:flex;gap:6px;flex-wrap:wrap}
.lec-badge{font-size:11px;padding:2px 8px;border-radius:20px;border:1px solid var(--border);color:var(--text3);background:var(--surface2)}
.lec-badge.has{color:var(--text2);background:var(--surface);border-color:var(--border2)}

/* ── Study tabs ── */
.study-tabs{display:flex;gap:4px;margin-bottom:28px;border-bottom:1px solid var(--border);overflow-x:auto}
.study-tab{padding:10px 16px;border:none;background:none;font-family:var(--sans);font-size:13px;color:var(--text3);cursor:pointer;border-bottom:2px solid transparent;margin-bottom:-1px;transition:all .15s;white-space:nowrap}
.study-tab:hover{color:var(--text2)}.study-tab.active{color:var(--text);font-weight:500;border-bottom-color:var(--eu)}
.study-panel{display:none}.study-panel.active{display:block}

/* ── Summary ── */
.sum-card{background:var(--surface);border:1px solid var(--border);border-radius:var(--radius);padding:20px 24px;box-shadow:var(--shadow);margin-bottom:14px}
.sum-title{font-size:14px;font-weight:600;color:var(--text);margin-bottom:8px;display:flex;align-items:center;gap:8px}
.sum-card p{font-size:13.5px;color:var(--text2);line-height:1.7}
.sum-card ul{font-size:13.5px;color:var(--text2);line-height:1.75;padding-left:18px;margin-top:6px}
.sum-card ul li{margin-bottom:3px}
.badge{display:inline-flex;align-items:center;font-size:11px;font-weight:600;padding:2px 8px;border-radius:20px}
.b-eu{background:var(--eu-l);color:var(--eu)}.b-teal{background:var(--micro-l);color:var(--micro)}
.b-amber{background:var(--macro-l);color:var(--macro)}.b-coral{background:var(--ic-l);color:var(--ic)}
.b-purple{background:var(--ibt-l);color:var(--ibt)}
.note-box{border-left:3px solid var(--eu-m);background:var(--eu-l);border-radius:0 var(--radius-sm) var(--radius-sm) 0;padding:10px 14px;font-size:13px;color:var(--text2);line-height:1.6;margin-top:10px}

/* ── Comparison table ── */
.comp-table{width:100%;border-collapse:collapse;margin-top:8px}
.comp-table th{background:var(--surface2);font-size:12px;font-weight:600;text-align:left;padding:10px 14px;border:1px solid var(--border);color:var(--text2)}
.comp-table td{font-size:13px;color:var(--text2);padding:10px 14px;border:1px solid var(--border);vertical-align:top;line-height:1.5}
.comp-table tr:hover td{background:var(--surface2)}

/* ── Timeline ── */
.timeline{position:relative;padding-left:28px}
.timeline::before{content:'';position:absolute;left:8px;top:8px;bottom:8px;width:2px;background:linear-gradient(to bottom,var(--eu),var(--micro),var(--macro),var(--ic),var(--ibt));border-radius:2px}
.tl-item{position:relative;margin-bottom:24px}
.tl-dot{position:absolute;left:-24px;top:5px;width:14px;height:14px;border-radius:50%;border:2.5px solid var(--surface);box-shadow:0 0 0 1.5px currentColor}
.tl-year{font-size:11px;font-weight:600;letter-spacing:.06em;text-transform:uppercase;color:var(--text3);margin-bottom:2px}
.tl-card{background:var(--surface);border:1px solid var(--border);border-radius:var(--radius);padding:16px 18px;box-shadow:var(--shadow);cursor:pointer;transition:all .2s}
.tl-card:hover{box-shadow:var(--shadow-md);transform:translateX(3px)}
.tl-title{font-size:14px;font-weight:600;color:var(--text);margin-bottom:5px}
.tl-body{font-size:13px;color:var(--text2);margin-top:10px;line-height:1.65;display:none}
.tl-body.open{display:block}
.tl-toggle{font-size:12px;color:var(--eu);cursor:pointer;margin-top:4px}

/* ── Articles ── */
.art-grid{display:grid;grid-template-columns:1fr 1fr;gap:12px}
.art-card{background:var(--surface);border:1px solid var(--border);border-radius:var(--radius);padding:16px 18px;box-shadow:var(--shadow);cursor:pointer;transition:all .2s}
.art-card:hover{box-shadow:var(--shadow-md)}
.art-num{font-family:var(--serif);font-size:26px;color:var(--eu);font-style:italic}
.art-name{font-size:13px;font-weight:600;color:var(--text);margin:2px 0}
.art-desc{font-size:12.5px;color:var(--text2);line-height:1.5}
.art-detail{display:none;margin-top:10px;padding-top:10px;border-top:1px solid var(--border);font-size:12.5px;color:var(--text2);line-height:1.6}
.art-detail.open{display:block}

/* ── Spaced Repetition Flashcards ── */
.fc-header{display:flex;align-items:center;justify-content:space-between;margin-bottom:16px;flex-wrap:gap}
.fc-counter{font-size:13px;color:var(--text3)}
.fc-sr-bar{display:flex;gap:8px;align-items:center;font-size:12px;color:var(--text3);margin-bottom:20px}
.sr-pip{width:10px;height:10px;border-radius:50%;background:var(--border);transition:background .3s}
.sr-pip.know{background:var(--green)}.sr-pip.review{background:#e8a020}
.flashcard-wrap{perspective:1200px;margin-bottom:20px}
.flashcard{width:100%;min-height:240px;position:relative;transform-style:preserve-3d;transition:transform .5s cubic-bezier(.4,0,.2,1);cursor:pointer}
.flashcard.flipped{transform:rotateY(180deg)}
.fc-face{position:absolute;inset:0;backface-visibility:hidden;border-radius:var(--radius);border:1px solid var(--border);box-shadow:var(--shadow-md);display:flex;flex-direction:column;justify-content:center;align-items:center;padding:32px 40px;text-align:center}
.fc-front{background:var(--surface)}.fc-back{background:var(--eu);transform:rotateY(180deg)}
.fc-label{font-size:11px;font-weight:600;letter-spacing:.1em;text-transform:uppercase;margin-bottom:12px}
.fc-front .fc-label{color:var(--text3)}.fc-back .fc-label{color:rgba(255,255,255,.6)}
.fc-question{font-family:var(--serif);font-size:21px;line-height:1.35;color:var(--text)}
.fc-answer{font-size:14px;line-height:1.65;color:white}
.fc-src{font-size:11px;color:rgba(255,255,255,.55);margin-top:14px}
.fc-hint{font-size:12px;color:var(--text3);margin-top:14px}
.sr-btns{display:flex;gap:10px;justify-content:center;margin-top:4px}
.sr-btn{padding:9px 22px;border-radius:var(--radius-sm);border:none;font-family:var(--sans);font-size:13px;font-weight:500;cursor:pointer;transition:all .15s}
.sr-btn-hard{background:var(--red-l);color:var(--red);border:1px solid var(--ic-m)}
.sr-btn-hard:hover{background:#fad8d0}
.sr-btn-ok{background:var(--amber-l);color:var(--amber);border:1px solid var(--macro-m)}
.sr-btn-ok:hover{background:#fcebbf}
.sr-btn-easy{background:var(--green-l);color:var(--green);border:1px solid var(--micro-m)}
.sr-btn-easy:hover{background:#d0ede5}
.sr-mode-note{font-size:12px;color:var(--text3);text-align:center;margin-top:10px}
.fc-controls{display:flex;gap:10px;flex-wrap:wrap;margin-bottom:20px}
.fc-sr-done{background:var(--surface);border:1px solid var(--border);border-radius:var(--radius);padding:40px;text-align:center;box-shadow:var(--shadow-md)}
.fc-sr-done h3{font-family:var(--serif);font-size:24px;margin-bottom:8px}
.fc-sr-done p{font-size:14px;color:var(--text2);margin-bottom:20px}

/* ── Buttons ── */
.btn{padding:8px 18px;border-radius:var(--radius-sm);border:1px solid var(--border2);background:var(--surface);font-family:var(--sans);font-size:13px;font-weight:500;cursor:pointer;color:var(--text);transition:all .15s}
.btn:hover{background:var(--surface2)}
.btn-primary{background:var(--eu);color:white;border-color:var(--eu)}.btn-primary:hover{opacity:.9}
.btn-sm{padding:6px 14px;font-size:12px}

/* ── Quiz ── */
.quiz-prog{height:4px;background:var(--border);border-radius:2px;margin-bottom:24px;overflow:hidden}
.quiz-prog-fill{height:100%;border-radius:2px;background:var(--eu);transition:width .4s ease}
.quiz-meta{font-size:12.5px;color:var(--text3);margin-bottom:18px}
.quiz-q{font-family:var(--serif);font-size:22px;line-height:1.35;color:var(--text);margin-bottom:22px}
.quiz-opts{display:flex;flex-direction:column;gap:9px;margin-bottom:20px}
.quiz-opt{padding:13px 18px;border-radius:var(--radius-sm);border:1.5px solid var(--border);background:var(--surface);cursor:pointer;font-size:14px;color:var(--text);text-align:left;transition:all .15s;font-family:var(--sans)}
.quiz-opt:hover:not([disabled]){border-color:var(--eu);background:var(--eu-l);color:var(--eu)}
.quiz-opt.correct{border-color:var(--micro);background:var(--micro-l);color:var(--micro)}
.quiz-opt.wrong{border-color:var(--ic);background:var(--ic-l);color:var(--ic)}
.quiz-opt[disabled]{cursor:default}
.quiz-fb{padding:14px 18px;border-radius:var(--radius-sm);font-size:13.5px;line-height:1.6;display:none;margin-bottom:16px}
.quiz-fb.show{display:block}
.quiz-fb.correct{background:var(--micro-l);color:var(--micro);border:1px solid var(--micro-m)}
.quiz-fb.wrong{background:var(--ic-l);color:var(--ic);border:1px solid var(--ic-m)}

/* ── Weak spots tracker ── */
.quiz-score-screen{background:var(--surface);border:1px solid var(--border);border-radius:var(--radius);padding:36px;box-shadow:var(--shadow-md);display:none}
.quiz-score-screen.show{display:block}
.score-row{display:flex;align-items:center;gap:20px;margin-bottom:24px}
.score-big{font-family:var(--serif);font-size:64px;color:var(--eu);line-height:1}
.score-right{flex:1}
.score-lbl{font-size:14px;color:var(--text2);margin-bottom:4px}
.score-msg{font-size:15px;color:var(--text);font-weight:500}
.weak-section{margin-top:20px;padding-top:20px;border-top:1px solid var(--border)}
.weak-title{font-size:13px;font-weight:600;color:var(--text);margin-bottom:12px}
.weak-item{display:flex;align-items:center;gap:10px;padding:10px 14px;border-radius:var(--radius-sm);background:var(--red-l);border:1px solid var(--ic-m);margin-bottom:8px}
.weak-item-icon{font-size:16px}
.weak-item-text{font-size:13px;color:var(--red)}
.weak-item-tip{font-size:11px;color:var(--red);opacity:.8;margin-top:2px}
.strong-section{margin-top:12px}
.strong-item{display:flex;align-items:center;gap:10px;padding:8px 14px;border-radius:var(--radius-sm);background:var(--green-l);border:1px solid var(--micro-m);margin-bottom:6px}
.strong-item-text{font-size:13px;color:var(--green)}

/* ── Decision Tree ── */
.dtree{max-width:680px;margin:0 auto}
.dt-step{background:var(--surface);border:1px solid var(--border);border-radius:var(--radius);padding:20px 24px;box-shadow:var(--shadow);margin-bottom:12px;position:relative}
.dt-step.active-step{border-color:var(--eu);box-shadow:0 0 0 3px var(--eu-l),var(--shadow)}
.dt-step.done-step{opacity:.6;border-color:var(--micro);background:var(--micro-l)}
.dt-num{width:28px;height:28px;border-radius:50%;background:var(--eu-l);color:var(--eu);font-size:12px;font-weight:600;display:flex;align-items:center;justify-content:center;margin-bottom:10px}
.dt-step.done-step .dt-num{background:var(--micro-l);color:var(--micro)}
.dt-q{font-family:var(--serif);font-size:17px;color:var(--text);margin-bottom:14px}
.dt-opts{display:flex;gap:10px;flex-wrap:wrap}
.dt-opt{padding:9px 18px;border-radius:var(--radius-sm);border:1.5px solid var(--border);background:var(--surface2);font-family:var(--sans);font-size:13px;cursor:pointer;transition:all .15s;color:var(--text2)}
.dt-opt:hover{border-color:var(--eu);background:var(--eu-l);color:var(--eu)}
.dt-opt.selected{border-color:var(--eu);background:var(--eu);color:white}
.dt-result{background:var(--eu);color:white;border-radius:var(--radius);padding:20px 24px;margin-top:8px}
.dt-result h3{font-family:var(--serif);font-size:20px;margin-bottom:8px}
.dt-result p{font-size:13.5px;line-height:1.6;opacity:.9}
.dt-result .dt-article{display:inline-block;background:rgba(255,255,255,.2);border-radius:20px;padding:2px 10px;font-size:11px;font-weight:600;margin-top:10px;margin-right:6px}
.dt-connector{text-align:center;color:var(--text3);font-size:20px;margin:4px 0;line-height:1}
.dt-reset-bar{margin-top:16px;display:flex;gap:10px;align-items:center}
.scenario-bar{background:var(--surface2);border:1px solid var(--border);border-radius:var(--radius-sm);padding:12px 16px;margin-bottom:20px;font-size:13.5px;color:var(--text2);line-height:1.6}
.scenario-bar strong{color:var(--text)}
.scenario-pick{display:flex;gap:8px;flex-wrap:wrap;margin-bottom:20px}
.scenario-btn{padding:7px 14px;border-radius:var(--radius-sm);border:1px solid var(--border2);background:var(--surface);font-size:12.5px;cursor:pointer;color:var(--text2);font-family:var(--sans);transition:all .15s}
.scenario-btn:hover{background:var(--eu-l);border-color:var(--eu);color:var(--eu)}
.scenario-btn.active{background:var(--eu);color:white;border-color:var(--eu)}

/* ── Empty state ── */
.empty-state{text-align:center;padding:60px 40px;color:var(--text3)}
.empty-state h3{font-family:var(--serif);font-size:22px;color:var(--text2);margin-bottom:8px}
.empty-state p{font-size:14px;line-height:1.6}

@media(max-width:700px){.sidebar{display:none}.page{padding:24px 20px}.dash-grid,.art-grid{grid-template-columns:1fr}}
</style>
</head>
<body>
<div class="shell">

<!-- SIDEBAR -->
<aside class="sidebar">
  <div class="logo">
    <div class="logo-title">Study Hub</div>
    <div class="logo-sub">Semester Overview</div>
  </div>
  <nav class="nav">
    <div class="nav-label">Overview</div>
    <button class="nav-btn active" data-color="dash" onclick="showPage('dashboard',this)"><span class="nav-dot" style="background:var(--text3)"></span>Dashboard</button>
    <div class="nav-label">EU Law</div>
    <button class="nav-btn" data-color="eu" onclick="showPage('eu-overview',this)"><span class="nav-dot" style="background:var(--eu)"></span>All Sessions</button>
    <button class="nav-sub" onclick="showLecture('eu','v',this)">Session V</button>
    <button class="nav-sub" onclick="showLecture('eu','vi',this)">Session VI</button>
    <button class="nav-sub" style="opacity:.5;cursor:default;pointer-events:none">+ More coming</button>
    <div class="nav-label">Microeconomics</div>
    <button class="nav-btn" data-color="micro" onclick="showPage('micro-overview',this)"><span class="nav-dot" style="background:var(--micro)"></span>All Chapters</button>
    <div class="nav-label">Macroeconomics</div>
    <button class="nav-btn" data-color="macro" onclick="showPage('macro-overview',this)"><span class="nav-dot" style="background:var(--macro)"></span>All Chapters</button>
    <div class="nav-label">Intl. Business Trade</div>
    <button class="nav-btn" data-color="ibt" onclick="showPage('ibt-overview',this)"><span class="nav-dot" style="background:var(--ibt)"></span>All Chapters</button>
    <div class="nav-label">Intercultural Comp.</div>
    <button class="nav-btn" data-color="ic" onclick="showPage('ic-overview',this)"><span class="nav-dot" style="background:var(--ic)"></span>All Chapters</button>
  </nav>
</aside>

<!-- MAIN -->
<main class="main">

<!-- DASHBOARD -->
<div id="page-dashboard" class="page active">
  <div class="page-eyebrow">Spring Semester</div>
  <div class="page-title">Study Hub</div>
  <div class="page-desc">5 subjects · Click a subject to start studying.</div>
  <div class="dash-grid">
    <div class="subject-card sc-eu" onclick="showPage('eu-overview',null)">
      <div class="sc-name">EU Law</div><div class="sc-meta">Sessions · Prof. Adrian Cloer</div>
      <div class="sc-progress"><div class="sc-progress-fill" style="width:14%;background:var(--eu)"></div></div>
      <div class="sc-stats"><div class="sc-stat"><strong>2</strong> sessions loaded</div><div class="sc-stat"><strong>14</strong> flashcards</div><div class="sc-stat"><strong>15</strong> quiz Qs</div></div>
    </div>
    <div class="subject-card sc-micro" onclick="showPage('micro-overview',null)">
      <div class="sc-name">Microeconomics</div><div class="sc-meta">Chapters · Coming soon</div>
      <div class="sc-progress"><div class="sc-progress-fill" style="width:0%;background:var(--micro)"></div></div>
      <div class="sc-stats"><div class="sc-stat"><strong>0</strong> chapters loaded</div></div>
    </div>
    <div class="subject-card sc-macro" onclick="showPage('macro-overview',null)">
      <div class="sc-name">Macroeconomics</div><div class="sc-meta">Chapters · Coming soon</div>
      <div class="sc-progress"><div class="sc-progress-fill" style="width:0%;background:var(--macro)"></div></div>
      <div class="sc-stats"><div class="sc-stat"><strong>0</strong> chapters loaded</div></div>
    </div>
    <div class="subject-card sc-ibt" onclick="showPage('ibt-overview',null)">
      <div class="sc-name">International Business Trade</div><div class="sc-meta">Chapters · Coming soon</div>
      <div class="sc-progress"><div class="sc-progress-fill" style="width:0%;background:var(--ibt)"></div></div>
      <div class="sc-stats"><div class="sc-stat"><strong>0</strong> chapters loaded</div></div>
    </div>
    <div class="subject-card sc-ic" onclick="showPage('ic-overview',null)">
      <div class="sc-name">Intercultural Competence</div><div class="sc-meta">Chapters · Coming soon</div>
      <div class="sc-progress"><div class="sc-progress-fill" style="width:0%;background:var(--ic)"></div></div>
      <div class="sc-stats"><div class="sc-stat"><strong>0</strong> chapters loaded</div></div>
    </div>
  </div>
</div>

<!-- EU OVERVIEW -->
<div id="page-eu-overview" class="page">
  <div class="page-eyebrow" style="color:var(--eu)">EU Law</div>
  <div class="page-title">All Sessions</div>
  <div class="page-desc">Select a session to access its summary, flashcards, quiz, and interactive tools.</div>
  <div class="lectures-list">
    <div class="lec-card empty"><div class="lec-num" style="background:var(--eu-l);color:var(--eu)">01</div><div class="lec-info"><div class="lec-title">Session I</div><div class="lec-sub">Not yet added</div></div><div class="lec-badges"><span class="lec-badge">Summary</span><span class="lec-badge">Cards</span><span class="lec-badge">Quiz</span></div></div>
    <div class="lec-card empty"><div class="lec-num" style="background:var(--eu-l);color:var(--eu)">02</div><div class="lec-info"><div class="lec-title">Session II</div><div class="lec-sub">Not yet added</div></div><div class="lec-badges"><span class="lec-badge">Summary</span><span class="lec-badge">Cards</span><span class="lec-badge">Quiz</span></div></div>
    <div class="lec-card empty"><div class="lec-num" style="background:var(--eu-l);color:var(--eu)">03</div><div class="lec-info"><div class="lec-title">Session III</div><div class="lec-sub">Not yet added</div></div><div class="lec-badges"><span class="lec-badge">Summary</span><span class="lec-badge">Cards</span><span class="lec-badge">Quiz</span></div></div>
    <div class="lec-card empty"><div class="lec-num" style="background:var(--eu-l);color:var(--eu)">04</div><div class="lec-info"><div class="lec-title">Session IV</div><div class="lec-sub">Not yet added</div></div><div class="lec-badges"><span class="lec-badge">Summary</span><span class="lec-badge">Cards</span><span class="lec-badge">Quiz</span></div></div>
    <div class="lec-card" onclick="showLecture('eu','v',null)"><div class="lec-num" style="background:var(--eu-l);color:var(--eu)">05</div><div class="lec-info"><div class="lec-title">Session V</div><div class="lec-sub">Wrap-Up: BEPS · Legal Systems · EU History</div></div><div class="lec-badges"><span class="lec-badge has">Summary</span><span class="lec-badge has">Cards</span><span class="lec-badge has">Quiz</span></div></div>
    <div class="lec-card" onclick="showLecture('eu','vi',null)"><div class="lec-num" style="background:var(--eu-l);color:var(--eu)">06</div><div class="lec-info"><div class="lec-title">Session VI</div><div class="lec-sub">Nature of EU Law · 5 Landmark Cases · Decision Tree</div></div><div class="lec-badges"><span class="lec-badge has">Summary</span><span class="lec-badge has">Cards</span><span class="lec-badge has">Quiz</span><span class="lec-badge has">Interactive</span></div></div>
    <div class="lec-card empty"><div class="lec-num" style="background:var(--eu-l);color:var(--eu)">07+</div><div class="lec-info"><div class="lec-title">More sessions coming</div><div class="lec-sub">Share your notes to add the next session</div></div><div class="lec-badges"><span class="lec-badge">Summary</span><span class="lec-badge">Cards</span><span class="lec-badge">Quiz</span></div></div>
  </div>
</div>

<!-- ══ SESSION V ══ -->
<div id="page-eu-v" class="page">
  <div class="page-eyebrow" style="color:var(--eu)">EU Law · Session V</div>
  <div class="page-title">Wrap-Up</div>
  <div class="page-desc">BEPS &amp; global tax reform, legal systems, rule of law, and EU history overview.</div>
  <div class="study-tabs">
    <button class="study-tab active" onclick="showTab('sv','summary',this)">Summary</button>
    <button class="study-tab" onclick="showTab('sv','compare',this)">Compare</button>
    <button class="study-tab" onclick="showTab('sv','flashcards',this)">Flashcards</button>
    <button class="study-tab" onclick="showTab('sv','quiz',this)">Quiz</button>
  </div>

  <div id="sv-summary" class="study-panel active">
    <div class="sum-card">
      <div class="sum-title"><span class="badge b-amber">BEPS &amp; Global Tax Reform</span></div>
      <p>The BEPS (Base Erosion &amp; Profit Shifting) project was triggered by public outrage over legal but aggressive tax avoidance by multinationals (especially GAFAs). Led by OECD/G20, involving 148+ countries.</p>
      <ul>
        <li><strong>Why it matters:</strong> USD 100–240bn lost globally to aggressive tax planning annually — 4–10% of global CIT revenue. Developing countries suffer most (high reliance on CIT, low enforcement capacity).</li>
        <li><strong>Pillar 1</strong> — Reallocates taxing rights to market jurisdictions (where consumers are, not where HQ is). Targets MNEs with &gt;€20bn revenue &amp; &gt;10% profitability. <em>Currently stalled</em> — USA withdrew support under Trump. Result: unilateral digital service taxes emerging globally (patchwork).</li>
        <li><strong>Pillar 2</strong> — 15% global minimum corporate tax. Applies to MNE groups with &gt;€750m annual revenue (~8,000 groups worldwide). Implemented in EU via Directive 2022/2523 (in force 31.12.2023).</li>
        <li><strong>Pillar 2 key rules:</strong> IIR (Income Inclusion Rule — top-up at parent level), UTPR (Undertaxed Payments Rule — backstop), QDMTT (domestic top-up tax — jurisdictions apply top-up to themselves first).</li>
        <li><strong>EU implementation:</strong> BEPS measures implemented via ATAD (Anti-Tax Avoidance Directive). Peer reviews monitor implementation of BEPS minimum standards.</li>
        <li><strong>Tax terminology distinctions:</strong> Tax saving (legal, no avoidance intent) → Tax planning (legal, structuring affairs) → Tax avoidance (legal but contrary to legislative intent) → Aggressive tax planning → Tax evasion (illegal).</li>
      </ul>
    </div>
    <div class="sum-card">
      <div class="sum-title"><span class="badge b-teal">Legal Systems &amp; Rule of Law</span></div>
      <ul>
        <li><strong>Forms of legal systems:</strong> common law (case-based, UK/USA), code law (civil law, continental Europe), religious law, customary law.</li>
        <li><strong>Rule of law (Art. 2 TEU)</strong> — 6 aspects: (1) legality, (2) legal certainty, (3) prohibition of arbitrary executive power, (4) effective judicial protection, (5) separation of powers, (6) equality before the law.</li>
        <li><strong>Council of Europe</strong> (≠ EU!) — 46 member states, promotes rule of law, human rights, democracy. Home of European Court of Human Rights (ECHR). Russia excluded 2022. Not to be confused with: European Council, Council of the EU, or International Criminal Court (independent UN body).</li>
        <li><strong>German Basic Law (GG)</strong> — 5 state principles: Democracy (Art. 20(2) GG), Rechtsstaat, Republic, Federalism (Bund + 16 Länder), Sozialstaat. Safeguarded by Federal Constitutional Court (FCC) in Karlsruhe.</li>
        <li><strong>Separation of powers:</strong> Horizontal (legislative/executive/judicial — Montesquieu 1748, earlier: Locke 1689, Aristotle 4th c. BC) and Vertical (federal/Länder).</li>
        <li><strong>Democracy distinction:</strong> Popular sovereignty = source of power (people). Democracy = manner of exercising power. Direct vs indirect (referenda in Germany generally not possible — Art. 20 GG).</li>
      </ul>
    </div>
    <div class="sum-card">
      <div class="sum-title"><span class="badge b-purple">EU History — Key Timeline</span></div>
      <ul>
        <li><strong>1945:</strong> WWII ends. UN founded (June 26). Churchill calls for "United States of Europe" (Sept 19, 1946) — but without UK.</li>
        <li><strong>1949:</strong> Council of Europe founded (May 5).</li>
        <li><strong>1950:</strong> Schuman Plan (May 9 — now Europe Day).</li>
        <li><strong>1951:</strong> Treaty of Paris → ECSC (European Coal &amp; Steel Community). 1957: Treaties of Rome → EEC + Euratom. 1965: Merger Treaty (institutions unified).</li>
        <li><strong>1979:</strong> First direct EP elections. 1985: Schengen Agreement. 1987: Single European Act (extended competences, strengthened EP).</li>
        <li><strong>1992:</strong> Maastricht Treaty (monetary union). 1993: Copenhagen Criteria (political, economic, acquis conditions for accession).</li>
        <li><strong>2002:</strong> Euro introduced. 2004: Big eastward enlargement (10 CEE + Malta + Cyprus).</li>
        <li><strong>2009:</strong> Lisbon Treaty → Charter of Fundamental Rights becomes legally binding.</li>
        <li><strong>2016:</strong> Brexit vote. 2022: Russian aggression on Ukraine.</li>
        <li><strong>Charlemagne (747–814)</strong> — "Father of Europe": coronation 800 AD by Pope Leo III, Christianisation, administrative/educational reforms. Charlemagne Prize of Aachen awarded in his memory.</li>
      </ul>
    </div>
  </div>

  <div id="sv-compare" class="study-panel">
    <div class="sum-card">
      <div class="sum-title">BEPS Pillar 1 vs Pillar 2</div>
      <table class="comp-table">
        <tr><th>Feature</th><th>Pillar 1</th><th>Pillar 2</th></tr>
        <tr><td><strong>Goal</strong></td><td>Reallocate taxing rights to market jurisdictions</td><td>Ensure minimum 15% effective tax rate globally</td></tr>
        <tr><td><strong>Who it targets</strong></td><td>MNEs with &gt;€20bn revenue &amp; &gt;10% profitability</td><td>MNE groups with &gt;€750m annual revenue (~8,000 groups)</td></tr>
        <tr><td><strong>Mechanism</strong></td><td>Amount A (new taxing right) + Amount B (simplify arm's length)</td><td>IIR + UTPR + QDMTT (top-up tax rules)</td></tr>
        <tr><td><strong>Status</strong></td><td>Stalled — USA withdrew support</td><td>In force (EU: Directive 2022/2523, Dec 31, 2023)</td></tr>
        <tr><td><strong>Result without it</strong></td><td>Unilateral digital service taxes (patchwork)</td><td>Tax haven competition continues below 15%</td></tr>
      </table>
    </div>
    <div class="sum-card">
      <div class="sum-title">Council of Europe vs EU Institutions</div>
      <table class="comp-table">
        <tr><th></th><th>Council of Europe</th><th>European Council</th><th>Council of the EU</th></tr>
        <tr><td><strong>Members</strong></td><td>46 states (non-EU too)</td><td>EU heads of state</td><td>EU ministers by topic</td></tr>
        <tr><td><strong>Role</strong></td><td>Human rights, democracy, rule of law</td><td>Sets EU strategic direction</td><td>Legislates with EP, represents MS</td></tr>
        <tr><td><strong>Key body</strong></td><td>European Court of Human Rights</td><td>President (currently elected)</td><td>Rotating presidency</td></tr>
        <tr><td><strong>Part of EU?</strong></td><td>No — separate organisation</td><td>Yes</td><td>Yes</td></tr>
      </table>
    </div>
  </div>

  <div id="sv-flashcards" class="study-panel">
    <div class="fc-controls">
      <button class="btn btn-sm" onclick="shuffleFC('sv')">Shuffle</button>
      <button class="btn btn-sm" onclick="resetFC('sv')">Reset all</button>
      <span style="font-size:12px;color:var(--text3);margin-left:4px">Rate each card to focus on what you don't know yet</span>
    </div>
    <div class="fc-sr-bar" id="sv-sr-bar"></div>
    <div id="sv-fc-wrap">
      <div class="flashcard-wrap"><div class="flashcard" id="sv-fc-card" onclick="flipFC('sv')">
        <div class="fc-face fc-front"><div class="fc-label">Question</div><div class="fc-question" id="sv-fc-q"></div><div class="fc-hint">Click to reveal answer</div></div>
        <div class="fc-face fc-back"><div class="fc-label">Answer</div><div class="fc-answer" id="sv-fc-a"></div><div class="fc-src" id="sv-fc-src"></div></div>
      </div></div>
      <div class="sr-btns">
        <button class="sr-btn sr-btn-hard" onclick="rateFC('sv',0)">😬 Still learning</button>
        <button class="sr-btn sr-btn-ok" onclick="rateFC('sv',1)">🤔 Almost</button>
        <button class="sr-btn sr-btn-easy" onclick="rateFC('sv',2)">✓ Got it</button>
      </div>
      <div class="sr-mode-note" id="sv-sr-note">Card <span id="sv-fc-counter">1</span> of <span id="sv-fc-total">1</span></div>
    </div>
    <div class="fc-sr-done" id="sv-fc-done" style="display:none">
      <h3>Session complete! 🎉</h3>
      <p id="sv-done-msg"></p>
      <div style="display:flex;gap:10px;justify-content:center;margin-top:16px">
        <button class="btn btn-primary" onclick="reviewWeak('sv')">Review weak cards</button>
        <button class="btn" onclick="resetFC('sv')">Start over</button>
      </div>
    </div>
  </div>

  <div id="sv-quiz" class="study-panel">
    <div id="sv-quiz-wrap">
      <div class="quiz-prog"><div class="quiz-prog-fill" id="sv-qpfill" style="width:0%"></div></div>
      <div class="quiz-meta" id="sv-q-meta"></div>
      <div class="quiz-q" id="sv-q-text"></div>
      <div class="quiz-opts" id="sv-q-opts"></div>
      <div class="quiz-fb" id="sv-q-fb"></div>
      <div id="sv-q-next" style="display:none"><button class="btn btn-primary" onclick="nextQ('sv')">Next →</button></div>
    </div>
    <div class="quiz-score-screen" id="sv-quiz-score">
      <div class="score-row">
        <div class="score-big" id="sv-score-big"></div>
        <div class="score-right"><div class="score-lbl">correct answers</div><div class="score-msg" id="sv-score-msg"></div></div>
      </div>
      <div class="weak-section" id="sv-weak-section"></div>
      <div style="margin-top:20px;display:flex;gap:10px">
        <button class="btn btn-primary" onclick="restartQuiz('sv')">Try again</button>
        <button class="btn" onclick="showTab('sv','flashcards', document.querySelector('#page-eu-v .study-tab:nth-child(3))'))">Review flashcards</button>
      </div>
    </div>
  </div>
</div>

<!-- ══ SESSION VI ══ -->
<div id="page-eu-vi" class="page">
  <div class="page-eyebrow" style="color:var(--eu)">EU Law · Session VI</div>
  <div class="page-title">Nature of EU Law</div>
  <div class="page-desc">The 5 landmark cases + interactive case analysis tool. Focus on the method.</div>
  <div class="study-tabs">
    <button class="study-tab active" onclick="showTab('svi','summary',this)">Summary</button>
    <button class="study-tab" onclick="showTab('svi','timeline',this)">Case Timeline</button>
    <button class="study-tab" onclick="showTab('svi','compare',this)">Compare</button>
    <button class="study-tab" onclick="showTab('svi','dtree',this)">Case Analyser</button>
    <button class="study-tab" onclick="showTab('svi','articles',this)">Articles</button>
    <button class="study-tab" onclick="showTab('svi','flashcards',this)">Flashcards</button>
    <button class="study-tab" onclick="showTab('svi','quiz',this)">Quiz</button>
  </div>

  <div id="svi-summary" class="study-panel active">
    <div class="sum-card">
      <div class="sum-title"><span class="badge b-eu">The 5 Landmark Cases — Overview</span></div>
      <p>These cases define how EU law relates to national law. The professor's focus: not memorising facts, but mastering the <em>method</em> — how to identify a legal issue and apply the right principle.</p>
      <div class="note-box"><strong>Exam method:</strong> (1) Identify conflict (EU vs. national law) → (2) Apply primacy (Costa) → (3) Check direct effect (Van Gend) → (4) National court duty (Simmenthal) → (5) Directive not implemented? → State liability (Francovich).</div>
    </div>
    <div class="sum-card">
      <div class="sum-title">EU Legal Order — Full Structure</div>
      <ul>
        <li><strong>Primary law (Art. 1(3) TEU):</strong> TEU + TFEU + Charter of Fundamental Rights — all have equal legal value since Lisbon 2009. Art. 6(1) TEU makes Charter binding.</li>
        <li><strong>Regulation (Art. 288(2) TFEU):</strong> Binding in entirety, directly applicable in all MS — no national implementation needed. Example: passenger rights regulation.</li>
        <li><strong>Directive (Art. 288(3) TFEU):</strong> Binding as to the result to be achieved. MS chooses form and method. Can have vertical direct effect once implementation deadline lapses + provision is clear, precise, unconditional. No horizontal direct effect (individual vs. individual).</li>
        <li><strong>Decision (Art. 288(4) TFEU):</strong> Binding in entirety, but only on specific addressees (MS or individuals).</li>
        <li><strong>Recommendations &amp; Opinions:</strong> Not binding — soft law. Used for guidance.</li>
      </ul>
    </div>
    <div class="sum-card">
      <div class="sum-title">The 5 Cases — Quick Reference</div>
      <ul>
        <li><strong>Van Gend en Loos (1963)</strong> — Direct Effect. Individuals can rely on EU law directly. Requirements: clear, precise, unconditional. Art. 30 TFEU (ex Art. 12 EEC).</li>
        <li><strong>Costa v. ENEL (1964)</strong> — Primacy. EU law prevails over all national law including later legislation. MS permanently limited sovereignty. Without primacy, EU law would be meaningless.</li>
        <li><strong>Internationale Handelsgesellschaft (1970)</strong> — Primacy extends to constitutional law. National constitutions cannot override EU law. But: fundamental rights exist as general principles of EU law (pre-Charter).</li>
        <li><strong>Simmenthal (1978)</strong> — Immediate effectiveness. National courts must immediately disapply conflicting national law — no waiting for constitutional court or legislature. MS cannot enact new conflicting laws.</li>
        <li><strong>Francovich (1991)</strong> — State liability. MS must compensate individuals for damage from failure to implement EU law. 3 conditions: directive grants rights, content identifiable, causal link. + Deadline elapsed.</li>
      </ul>
    </div>
    <div class="sum-card">
      <div class="sum-title">Direct Effect — Types &amp; Limits</div>
      <ul>
        <li><strong>Vertical direct effect:</strong> individual relies on EU law against the state → allowed for both Treaty provisions and directives (once deadline lapses).</li>
        <li><strong>Horizontal direct effect:</strong> individual relies on EU law against another private party → allowed for Treaty provisions, but NOT for directives.</li>
        <li><strong>Why no horizontal DE for directives?</strong> Directives are addressed to MS — they only bind MS. Imposing obligations on individuals would bypass national implementation.</li>
        <li><strong>Remedy when no DE:</strong> Francovich state liability. Individual sues the MS for failing to implement, not the private party.</li>
        <li><strong>Indirect effect (consistent interpretation):</strong> National courts must interpret national law in light of the directive's purpose — even if direct effect not available.</li>
      </ul>
    </div>
  </div>

  <div id="svi-timeline" class="study-panel">
    <div class="timeline">
      <div class="tl-item"><div class="tl-dot" style="color:var(--eu)"></div><div class="tl-year">1963</div><div class="tl-card" onclick="toggleTl(this)"><div class="tl-title">Van Gend en Loos · <span style="font-weight:400;color:var(--text3)">Case 26/62</span></div><span class="badge b-eu">⚡ Direct Effect</span><div class="tl-toggle">+ Show details</div><div class="tl-body"><strong>Facts:</strong> Dutch company (Van Gend &amp; Loos) imported urea-formaldehyde from Germany. Dutch customs reclassified it under a higher-duty category, raising the duty from 3% to 8% — violating the EEC standstill clause on customs duties.<br><br><strong>Legal question:</strong> Can individuals directly invoke EU law in national courts?<br><br><strong>ECJ holding:</strong> Yes. The EEC constitutes a "new legal order of international law" — unlike ordinary international law, it creates rights for individuals which national courts must protect. The standstill provision (now Art. 30 TFEU) had direct effect.<br><br><strong>3 Requirements for direct effect:</strong> Provision must be (1) clear, (2) precise, (3) unconditional — creating a right without further legislative action.<br><br><strong>Significance:</strong> First time EU law was declared to create enforceable individual rights. Foundation of the entire EU legal order as we know it.</div></div></div>
      <div class="tl-item"><div class="tl-dot" style="color:var(--micro)"></div><div class="tl-year">1964</div><div class="tl-card" onclick="toggleTl(this)"><div class="tl-title">Costa v. ENEL · <span style="font-weight:400;color:var(--text3)">Case 6/64</span></div><span class="badge b-teal">⚡ Primacy of EU Law</span><div class="tl-toggle">+ Show details</div><div class="tl-body"><strong>Facts:</strong> Italy nationalised its electricity sector, creating Enel. Costa (advised by Prof. Stendardi) refused to pay his Enel bill, arguing the nationalisation law violated EEC law. The Italian Constitutional Court had already ruled that the later Italian law should prevail over earlier EEC law.<br><br><strong>ECJ holding:</strong> EU law is an integral part of national legal systems and takes precedence. MS permanently limited their sovereign rights by joining. A later national law cannot override earlier EU law.<br><br><strong>Reasoning:</strong> If MS could override EU law by passing national legislation, the EU's functioning would be put in jeopardy. The EEC has a "special and original nature" that distinguishes it from general international law.<br><br><strong>Consequence:</strong> National courts must apply EU law over conflicting national law — regardless of when the national law was passed.</div></div></div>
      <div class="tl-item"><div class="tl-dot" style="color:var(--ibt)"></div><div class="tl-year">1970</div><div class="tl-card" onclick="toggleTl(this)"><div class="tl-title">Internationale Handelsgesellschaft</div><span class="badge b-purple">⚡ Primacy over Constitutional Law</span><div class="tl-toggle">+ Show details</div><div class="tl-body"><strong>Facts:</strong> German private company faced forfeiture of its export licence deposit under an EU regulation. German court argued this violated German constitutional fundamental rights (Art. 2(1) — general freedom of action, Art. 14 GG — property rights).<br><br><strong>ECJ holding (double principle):</strong><br>(1) EU law cannot be reviewed against national constitutional law. The yardstick for EU law's validity is EU law only. Only the ECJ can declare EU law invalid — national courts cannot.<br>(2) BUT: fundamental rights form an integral part of the general principles of EU law, drawn from the constitutional traditions of MS and international instruments (esp. ECHR).<br><br><strong>Historical context:</strong> At the time (1970), there was no written EU catalogue of fundamental rights. This case created the foundation for EU fundamental rights protection.<br><br><strong>Legacy:</strong> Led eventually to the Charter of Fundamental Rights (2000, binding since Lisbon 2009).<br><br><strong>Tension:</strong> German Federal Constitutional Court ("Solange" judgments) initially resisted this — still an ongoing constitutional dialogue.</div></div></div>
      <div class="tl-item"><div class="tl-dot" style="color:var(--macro)"></div><div class="tl-year">1978</div><div class="tl-card" onclick="toggleTl(this)"><div class="tl-title">Simmenthal · <span style="font-weight:400;color:var(--text3)">Case 106/77</span></div><span class="badge b-amber">⚡ Immediate Effectiveness</span><div class="tl-toggle">+ Show details</div><div class="tl-body"><strong>Facts:</strong> Italian authorities required Simmenthal to pay fees for veterinary/public health inspections at the Italian border — incompatible with EU free movement of goods rules. Italy argued its national law (enacted under EC Treaty) would take precedence.<br><br><strong>ECJ holding:</strong><br>(1) Every national court must apply EU law in its entirety and protect rights conferred on individuals.<br>(2) Any conflicting national provision — even those enacted AFTER the EU rule — must be rendered inapplicable immediately.<br>(3) No need to wait for a constitutional court ruling or parliamentary repeal. National courts act immediately.<br>(4) MS also cannot enact new laws that conflict with EU law.<br><br><strong>Why it matters:</strong> Operationalises primacy. Costa said EU law prevails in theory; Simmenthal tells courts exactly what to do about it in practice.<br><br><strong>Exam trap:</strong> Courts do NOT need to refer to a constitutional court, legislative body, or the ECJ before disapplying national law.</div></div></div>
      <div class="tl-item"><div class="tl-dot" style="color:var(--ic)"></div><div class="tl-year">1991</div><div class="tl-card" onclick="toggleTl(this)"><div class="tl-title">Francovich &amp; Bonifaci · <span style="font-weight:400;color:var(--text3)">C-6/90, C-9/90</span></div><span class="badge b-coral">⚡ State Liability</span><div class="tl-toggle">+ Show details</div><div class="tl-body"><strong>Facts:</strong> Directive 80/987 required MS to create a guarantee fund protecting employees' wages if their employer went insolvent. Italy failed to implement this directive by the 1983 deadline. Francovich and Bonifaci were owed wages by insolvent employers and had no remedy because the fund didn't exist.<br><br><strong>ECJ holding:</strong> MS are liable to compensate individuals for damage caused by their failure to implement EU law. This flows from the full effectiveness of EU law — if directives could be ignored without consequence, they would lose their binding force.<br><br><strong>3 Conditions:</strong><br>(1) The directive must grant rights to individuals.<br>(2) The content of those rights must be identifiable from the directive's text.<br>(3) There must be a causal link between the MS's breach and the individual's damage.<br>+ The implementation deadline must have elapsed.<br><br><strong>Vertical DE vs Francovich:</strong> If a directive has direct effect → individual can rely on it against the state directly. If no direct effect (content not sufficiently clear, or horizontal situation) → Francovich state liability applies instead.<br><br><strong>Why it matters:</strong> Without liability, MS would have no incentive to implement directives promptly. Completes the EU enforcement picture.</div></div></div>
    </div>
  </div>

  <div id="svi-compare" class="study-panel">
    <div class="sum-card">
      <div class="sum-title">Types of EU Secondary Law — Art. 288 TFEU</div>
      <table class="comp-table">
        <tr><th>Type</th><th>Binding?</th><th>Who?</th><th>Implementation?</th><th>Direct Effect?</th></tr>
        <tr><td><strong>Regulation</strong></td><td>Yes — in entirety</td><td>All MS + individuals</td><td>None needed</td><td>Yes — always</td></tr>
        <tr><td><strong>Directive</strong></td><td>Yes — as to result</td><td>MS (not individuals directly)</td><td>MS chooses form &amp; method</td><td>Vertical only (if deadline lapsed + clear/precise/unconditional)</td></tr>
        <tr><td><strong>Decision</strong></td><td>Yes — in entirety</td><td>Specific addressees only</td><td>None needed</td><td>Yes (for addressee)</td></tr>
        <tr><td><strong>Recommendation</strong></td><td>No</td><td>—</td><td>—</td><td>No</td></tr>
        <tr><td><strong>Opinion</strong></td><td>No</td><td>—</td><td>—</td><td>No</td></tr>
      </table>
    </div>
    <div class="sum-card">
      <div class="sum-title">The 5 Cases — Principles at a Glance</div>
      <table class="comp-table">
        <tr><th>Case</th><th>Year</th><th>Principle</th><th>Key rule</th></tr>
        <tr><td><strong>Van Gend en Loos</strong></td><td>1963</td><td>Direct Effect</td><td>Individuals can rely on EU law directly — if clear, precise, unconditional</td></tr>
        <tr><td><strong>Costa v. ENEL</strong></td><td>1964</td><td>Primacy</td><td>EU law prevails over all national law, including later legislation</td></tr>
        <tr><td><strong>Int'l Handelsgesellschaft</strong></td><td>1970</td><td>Primacy over constitutions</td><td>Even national constitutions cannot override EU law. Only ECJ can invalidate EU law</td></tr>
        <tr><td><strong>Simmenthal</strong></td><td>1978</td><td>Immediate effectiveness</td><td>National courts must immediately disapply conflicting national law — no waiting</td></tr>
        <tr><td><strong>Francovich</strong></td><td>1991</td><td>State liability</td><td>MS must compensate individuals for damage from failure to implement EU law</td></tr>
      </table>
    </div>
  </div>

  <!-- DECISION TREE / CASE ANALYSER -->
  <div id="svi-dtree" class="study-panel">
    <div class="sum-card" style="margin-bottom:20px">
      <div class="sum-title">🔍 EU Law Case Analyser</div>
      <p>Work through a real scenario step by step — the same method you'll use in the exam. Pick a scenario or type your own, then answer each question to reach the correct legal conclusion.</p>
    </div>
    <div class="scenario-pick" id="scenario-pick">
      <button class="scenario-btn active" onclick="loadScenario(0,this)">Import duty raised</button>
      <button class="scenario-btn" onclick="loadScenario(1,this)">Conflicting national law</button>
      <button class="scenario-btn" onclick="loadScenario(2,this)">Directive not implemented</button>
      <button class="scenario-btn" onclick="loadScenario(3,this)">Constitutional conflict</button>
    </div>
    <div class="scenario-bar" id="scenario-desc"></div>
    <div class="dtree" id="dtree-container"></div>
  </div>

  <div id="svi-articles" class="study-panel">
    <div class="art-grid">
      <div class="art-card" onclick="this.querySelector('.art-detail').classList.toggle('open')"><div class="art-num">Art. 1</div><div class="art-name">TEU — Foundation</div><div class="art-desc">EU founded on TEU + TFEU. Equal legal value.</div><div class="art-detail">The EU is founded on the TEU and TFEU, which have the same legal value. The EU replaces and succeeds the European Community. Key: the two treaties together are the constitutional basis of the EU.</div></div>
      <div class="art-card" onclick="this.querySelector('.art-detail').classList.toggle('open')"><div class="art-num">Art. 2</div><div class="art-name">TEU — Values &amp; Rule of Law</div><div class="art-desc">Founding values incl. rule of law, human dignity, democracy.</div><div class="art-detail">6 aspects of rule of law: (1) legality, (2) legal certainty, (3) prohibition of arbitrary executive power, (4) effective judicial protection, (5) separation of powers, (6) equality before the law. Violation → Art. 7 TEU procedure (infringement).</div></div>
      <div class="art-card" onclick="this.querySelector('.art-detail').classList.toggle('open')"><div class="art-num">Art. 5</div><div class="art-name">TEU — Conferral</div><div class="art-desc">EU acts only within limits of conferred competences.</div><div class="art-detail">The EU has no inherent powers — all competence flows from explicit conferral in the Treaties. Powers not conferred remain with Member States (cf. subsidiarity and proportionality also in Art. 5 TEU). This is the fundamental limit on EU authority.</div></div>
      <div class="art-card" onclick="this.querySelector('.art-detail').classList.toggle('open')"><div class="art-num">Art. 6(1)</div><div class="art-name">TEU — Charter Binding</div><div class="art-desc">Charter has same legal value as Treaties since Lisbon 2009.</div><div class="art-detail">Since the Lisbon Treaty (2009), the Charter of Fundamental Rights is legally binding primary law with the same status as TEU and TFEU. Before Lisbon: fundamental rights existed only as general principles of EU law (Internationale Handelsgesellschaft, 1970).</div></div>
      <div class="art-card" onclick="this.querySelector('.art-detail').classList.toggle('open')"><div class="art-num">Art. 19</div><div class="art-name">TEU — Role of ECJ</div><div class="art-desc">Court ensures EU law observed. One judge per MS.</div><div class="art-detail">Establishes the CJEU (ECJ + General Court + specialised courts). One judge per Member State. Judges must be independent — politically, financially, mentally. Court ensures uniform interpretation and application of EU law across all MS.</div></div>
      <div class="art-card" onclick="this.querySelector('.art-detail').classList.toggle('open')"><div class="art-num">Art. 252</div><div class="art-name">TFEU — Advocate General</div><div class="art-desc">AGs deliver independent, impartial opinions to assist the Court.</div><div class="art-detail">Advocates General deliver reasoned, impartial opinions — not binding but highly influential. Currently 11 AGs. Role: assist in achieving open, consistent application of EU law. Their opinions often shape future case law even if not followed immediately.</div></div>
      <div class="art-card" onclick="this.querySelector('.art-detail').classList.toggle('open')"><div class="art-num">Art. 267</div><div class="art-name">TFEU — Preliminary Ruling</div><div class="art-desc">National courts refer EU law questions to ECJ for uniform interpretation.</div><div class="art-detail">Primary mechanism for uniform application of EU law. Lower courts may refer; courts of last instance must refer (obligation). ECJ answers on: (1) interpretation of EU law, or (2) validity of EU acts (only ECJ can declare EU law invalid — Internationale Handelsgesellschaft). Van Gend and Costa both came through this procedure.</div></div>
      <div class="art-card" onclick="this.querySelector('.art-detail').classList.toggle('open')"><div class="art-num">Art. 288</div><div class="art-name">TFEU — Secondary Law</div><div class="art-desc">Defines all types of EU legal acts and their binding nature.</div><div class="art-detail"><strong>Regulation:</strong> Directly applicable — no MS implementation needed. Binding in entirety.<br><strong>Directive:</strong> Binding as to result — MS chooses form &amp; method. Vertical DE possible once deadline lapses.<br><strong>Decision:</strong> Binding on specific addressees only.<br><strong>Soft law:</strong> Recommendations &amp; opinions — not binding but can have legal relevance.</div></div>
      <div class="art-card" onclick="this.querySelector('.art-detail').classList.toggle('open')"><div class="art-num">Art. 30</div><div class="art-name">TFEU — No Customs Duties</div><div class="art-desc">Prohibits customs duties and charges of equivalent effect between MS.</div><div class="art-detail">This was Art. 12 EEC Treaty — the provision at stake in Van Gend en Loos. The ECJ held it had direct effect: it was clear, precise, and unconditional. No MS action needed — Van Gend could rely on it directly. Now codified as Art. 30 TFEU.</div></div>
    </div>
  </div>

  <div id="svi-flashcards" class="study-panel">
    <div class="fc-controls">
      <button class="btn btn-sm" onclick="shuffleFC('svi')">Shuffle</button>
      <button class="btn btn-sm" onclick="resetFC('svi')">Reset all</button>
      <span style="font-size:12px;color:var(--text3);margin-left:4px">Rate each card — hard ones come back sooner</span>
    </div>
    <div class="fc-sr-bar" id="svi-sr-bar"></div>
    <div id="svi-fc-wrap">
      <div class="flashcard-wrap"><div class="flashcard" id="svi-fc-card" onclick="flipFC('svi')">
        <div class="fc-face fc-front"><div class="fc-label">Question</div><div class="fc-question" id="svi-fc-q"></div><div class="fc-hint">Click to reveal answer</div></div>
        <div class="fc-face fc-back"><div class="fc-label">Answer</div><div class="fc-answer" id="svi-fc-a"></div><div class="fc-src" id="svi-fc-src"></div></div>
      </div></div>
      <div class="sr-btns">
        <button class="sr-btn sr-btn-hard" onclick="rateFC('svi',0)">😬 Still learning</button>
        <button class="sr-btn sr-btn-ok" onclick="rateFC('svi',1)">🤔 Almost</button>
        <button class="sr-btn sr-btn-easy" onclick="rateFC('svi',2)">✓ Got it</button>
      </div>
      <div class="sr-mode-note" id="svi-sr-note">Card <span id="svi-fc-counter">1</span> of <span id="svi-fc-total">1</span></div>
    </div>
    <div class="fc-sr-done" id="svi-fc-done" style="display:none">
      <h3>Session complete! 🎉</h3>
      <p id="svi-done-msg"></p>
      <div style="display:flex;gap:10px;justify-content:center;margin-top:16px">
        <button class="btn btn-primary" onclick="reviewWeak('svi')">Review weak cards</button>
        <button class="btn" onclick="resetFC('svi')">Start over</button>
      </div>
    </div>
  </div>

  <div id="svi-quiz" class="study-panel">
    <div id="svi-quiz-wrap">
      <div class="quiz-prog"><div class="quiz-prog-fill" id="svi-qpfill" style="width:0%"></div></div>
      <div class="quiz-meta" id="svi-q-meta"></div>
      <div class="quiz-q" id="svi-q-text"></div>
      <div class="quiz-opts" id="svi-q-opts"></div>
      <div class="quiz-fb" id="svi-q-fb"></div>
      <div id="svi-q-next" style="display:none"><button class="btn btn-primary" onclick="nextQ('svi')">Next →</button></div>
    </div>
    <div class="quiz-score-screen" id="svi-quiz-score">
      <div class="score-row">
        <div class="score-big" id="svi-score-big"></div>
        <div class="score-right"><div class="score-lbl">correct answers</div><div class="score-msg" id="svi-score-msg"></div></div>
      </div>
      <div class="weak-section" id="svi-weak-section"></div>
      <div style="margin-top:20px;display:flex;gap:10px">
        <button class="btn btn-primary" onclick="restartQuiz('svi')">Try again</button>
      </div>
    </div>
  </div>
</div>

<!-- OTHER SUBJECTS -->
<div id="page-micro-overview" class="page"><div class="page-eyebrow" style="color:var(--micro)">Microeconomics</div><div class="page-title">All Chapters</div><div class="page-desc">No chapters loaded yet.</div><div class="empty-state"><h3>Ready to populate</h3><p>Share your Micro notes and I'll build the summary, flashcards, quiz, and interactive practice problems for each chapter.</p></div></div>
<div id="page-macro-overview" class="page"><div class="page-eyebrow" style="color:var(--macro)">Macroeconomics</div><div class="page-title">All Chapters</div><div class="page-desc">No chapters loaded yet.</div><div class="empty-state"><h3>Ready to populate</h3><p>Share your Macro notes and I'll build the summary, flashcards, quiz, and formula calculator for each chapter.</p></div></div>
<div id="page-ibt-overview" class="page"><div class="page-eyebrow" style="color:var(--ibt)">International Business Trade</div><div class="page-title">All Chapters</div><div class="page-desc">No chapters loaded yet.</div><div class="empty-state"><h3>Ready to populate</h3><p>Share your IBT notes and I'll build the summary, flashcards, and quiz for each chapter.</p></div></div>
<div id="page-ic-overview" class="page"><div class="page-eyebrow" style="color:var(--ic)">Intercultural Competence</div><div class="page-title">All Chapters</div><div class="page-desc">No chapters loaded yet.</div><div class="empty-state"><h3>Ready to populate</h3><p>Share your IC notes and I'll build the summary, flashcards, and quiz for each chapter.</p></div></div>

</main>
</div>
<script>
// ── Navigation ──
function showPage(id,btn){document.querySelectorAll('.page').forEach(p=>p.classList.remove('active'));document.querySelectorAll('.nav-btn').forEach(b=>b.classList.remove('active'));document.getElementById('page-'+id).classList.add('active');if(btn)btn.classList.add('active')}
function showLecture(subject,id,btn){document.querySelectorAll('.page').forEach(p=>p.classList.remove('active'));document.querySelectorAll('.nav-sub').forEach(b=>b.classList.remove('active'));if(btn)btn.classList.add('active');const el=document.getElementById('page-'+subject+'-'+id);if(el){el.classList.add('active');if(subject==='eu'&&id==='v'){initFC('sv');initQuiz('sv')}if(subject==='eu'&&id==='vi'){initFC('svi');initQuiz('svi');loadScenario(0,document.querySelector('.scenario-btn'))}}}
function showTab(prefix,tab,btn){const page=document.querySelector('.page.active');if(page){page.querySelectorAll('.study-panel').forEach(p=>p.classList.remove('active'));page.querySelectorAll('.study-tab').forEach(b=>b.classList.remove('active'))}document.getElementById(prefix+'-'+tab).classList.add('active');if(btn)btn.classList.add('active')}
function toggleTl(card){const body=card.querySelector('.tl-body');const toggle=card.querySelector('.tl-toggle');body.classList.toggle('open');toggle.textContent=body.classList.contains('open')?'− Hide details':'+ Show details'}

// ── Flashcard data ──
const fcDataMap={
  sv:[
    {q:"What are the two BEPS pillars and their goals?",a:"Pillar 1: reallocates taxing rights to market jurisdictions (where consumers are). Pillar 2: ensures 15% global minimum corporate tax for MNEs with >€750m revenue.",src:"Session V — BEPS",topic:"BEPS"},
    {q:"Why is BEPS Pillar 1 currently stalled?",a:"The USA withdrew support under the Trump administration, preventing global implementation. Result: countries are imposing unilateral digital service taxes (a 'patchwork').",src:"Session V — BEPS",topic:"BEPS"},
    {q:"Which EU directive implemented Pillar 2, and when did it enter into force?",a:"Directive 2022/2523, in force 31 December 2023.",src:"Session V — BEPS",topic:"BEPS"},
    {q:"What is the revenue threshold for MNEs under BEPS Pillar 2?",a:"Annual consolidated group revenue of at least €750 million (~8,000 corporate groups globally affected).",src:"Session V — BEPS",topic:"BEPS"},
    {q:"What are the three key Pillar 2 mechanisms?",a:"IIR (Income Inclusion Rule — top-up tax at parent level), UTPR (Undertaxed Payments Rule — backstop), QDMTT (Qualified Domestic Minimum Top-up Tax — domestic first application).",src:"Session V — BEPS",topic:"BEPS"},
    {q:"What is the difference between tax avoidance and tax evasion?",a:"Tax avoidance is legal (though may be contrary to legislative intent). Tax evasion is illegal (deliberate non-payment/misrepresentation). Between them: aggressive tax planning.",src:"Session V — Tax",topic:"Tax"},
    {q:"What are the 6 aspects of the rule of law under Art. 2 TEU?",a:"(1) Legality, (2) legal certainty, (3) prohibition of arbitrary executive power, (4) effective judicial protection, (5) separation of powers, (6) equality before the law.",src:"Session V — Legal Systems",topic:"Legal Systems"},
    {q:"What is the Council of Europe and how does it differ from the EU?",a:"A separate intergovernmental organisation with 46 member states (not limited to EU). Promotes rule of law, human rights, democracy. Home of the ECHR. Not part of the EU.",src:"Session V — Legal Systems",topic:"Legal Systems"},
    {q:"Name three things often confused with the Council of Europe.",a:"(1) European Council (EU heads of state), (2) Council of the EU (ministers), (3) International Criminal Court (independent UN body).",src:"Session V — Legal Systems",topic:"Legal Systems"},
    {q:"What are the 5 state principles of the German Basic Law?",a:"Democracy (Art. 20(2) GG), Rechtsstaat (rule of law), Republic (no monarchy), Federalism (Bund + 16 Länder), Sozialstaat (social welfare state).",src:"Session V — Legal Systems",topic:"Legal Systems"},
    {q:"What is the Copenhagen Criteria (1993)?",a:"Conditions for EU accession: (1) political — stable institutions, rule of law, minority protection; (2) economic — functioning market economy; (3) acquis — ability to assume all EU obligations.",src:"Session V — EU History",topic:"EU History"},
    {q:"When was the Charter of Fundamental Rights created, and when did it become binding?",a:"Created in 2000. Became legally binding with the Lisbon Treaty in 2009 (Art. 6(1) TEU).",src:"Session V — EU History",topic:"EU History"},
  ],
  svi:[
    {q:"What principle did Van Gend en Loos establish?",a:"Direct Effect — individuals can directly rely on clear, precise, unconditional provisions of EU law in national courts, without MS action.",src:"Van Gend en Loos (1963)",topic:"Direct Effect"},
    {q:"What are the 3 requirements for direct effect?",a:"The provision must be (1) clear, (2) precise, (3) unconditional — meaning it creates a right that requires no further legislative action.",src:"Van Gend en Loos (1963)",topic:"Direct Effect"},
    {q:"What made the EEC a 'new legal order' in Van Gend?",a:"Unlike ordinary international law (which only creates obligations between states), the EEC created rights for individuals which national courts must protect directly.",src:"Van Gend en Loos (1963)",topic:"Direct Effect"},
    {q:"What principle did Costa v. ENEL establish?",a:"Primacy (Supremacy) — EU law takes precedence over all conflicting national law, including legislation enacted after the EU provision.",src:"Costa v. ENEL (1964)",topic:"Primacy"},
    {q:"Why can't a later national law override earlier EU law?",a:"MS permanently limited their sovereign rights when joining. If national law could override EU law, the EU's functioning would be jeopardised. EU law has a 'special and original nature'.",src:"Costa v. ENEL (1964)",topic:"Primacy"},
    {q:"Can national constitutional law override EU law?",a:"No. Per Internationale Handelsgesellschaft, the yardstick for reviewing EU law is EU law only — not national constitutions. Only the ECJ can declare EU law invalid.",src:"Internationale Handelsgesellschaft (1970)",topic:"Primacy"},
    {q:"What double principle did Internationale Handelsgesellschaft establish?",a:"(1) EU law cannot be reviewed against national constitutions — only ECJ can invalidate EU law. (2) BUT fundamental rights are general principles of EU law drawn from MS constitutional traditions.",src:"Internationale Handelsgesellschaft (1970)",topic:"Fundamental Rights"},
    {q:"Why was fundamental rights protection important in Internationale Handelsgesellschaft (1970)?",a:"At the time, there was no written EU catalogue of fundamental rights. The ECJ had to create protection through general principles — eventually leading to the Charter (2000/2009).",src:"Internationale Handelsgesellschaft (1970)",topic:"Fundamental Rights"},
    {q:"What must a national court do when it finds a conflict between national and EU law?",a:"Immediately disapply the conflicting national provision — without waiting for a constitutional court, legislative repeal, or referral to the ECJ. (Simmenthal)",src:"Simmenthal (1978)",topic:"National Courts"},
    {q:"What does Simmenthal say about new national laws conflicting with EU law?",a:"MS cannot enact new laws that conflict with existing EU law. Any such law is inapplicable from the moment it conflicts with EU law.",src:"Simmenthal (1978)",topic:"National Courts"},
    {q:"What are the 3 conditions for state liability under Francovich?",a:"(1) The directive grants rights to individuals. (2) The content of those rights is identifiable from the directive. (3) There is a causal link between the MS's breach and the individual's damage. + Deadline must have elapsed.",src:"Francovich (1991)",topic:"State Liability"},
    {q:"What is the difference between vertical and horizontal direct effect of directives?",a:"Vertical: individual relies on directive against the state — allowed once deadline lapses + provision is clear/precise/unconditional. Horizontal: individual vs. private party — NOT possible for directives.",src:"Francovich reasoning",topic:"Direct Effect"},
    {q:"When does Francovich apply instead of direct effect?",a:"When the directive cannot produce direct effect (content unclear, or situation is horizontal/private-private) but the MS failed to implement it. Individual then sues the MS for compensation.",src:"Francovich (1991)",topic:"State Liability"},
    {q:"What is indirect effect (consistent interpretation)?",a:"National courts must interpret national law in light of the directive's purpose and wording, as far as possible — even when direct effect is unavailable. Fills gap between DE and Francovich.",src:"EU Law general principle",topic:"Direct Effect"},
    {q:"Art. 288 TFEU: what is the key difference between a Regulation and a Directive?",a:"Regulation: directly applicable — binding in entirety, no MS implementation needed. Directive: binding only as to result — MS chooses form and method of implementation.",src:"Art. 288 TFEU",topic:"Secondary Law"},
    {q:"Which article governs the preliminary ruling procedure?",a:"Art. 267 TFEU. National courts refer questions on EU law interpretation or validity to the ECJ. Lower courts may refer; courts of last instance must refer.",src:"Art. 267 TFEU",topic:"Procedure"},
    {q:"What is the principle of conferral (Art. 5 TEU)?",a:"The EU has no inherent powers. It can only act where the Treaties explicitly grant competence. Powers not conferred remain with Member States.",src:"Art. 5 TEU",topic:"EU Structure"},
    {q:"Since Lisbon, what is the legal status of the Charter of Fundamental Rights?",a:"Same legal value as the TEU and TFEU — binding primary law (Art. 6(1) TEU). Before Lisbon: only general principles (Internationale Handelsgesellschaft).",src:"Art. 6(1) TEU",topic:"Fundamental Rights"},
  ]
};

// ── Spaced Repetition Engine ──
const fcState={};
function initFC(prefix){
  const data=fcDataMap[prefix];
  fcState[prefix]={
    all:[...data].map((c,i)=>({...c,idx:i,confidence:1,due:0})),
    queue:[],
    current:0,
    pass:0
  };
  buildQueue(prefix);
  renderFC(prefix);
  renderSRBar(prefix);
}
function buildQueue(prefix){
  const s=fcState[prefix];
  s.queue=[...s.all].sort(()=>Math.random()-.5);
  s.current=0;
}
function renderFC(prefix){
  const s=fcState[prefix];
  if(!s||s.queue.length===0)return;
  const c=s.queue[s.current];
  document.getElementById(prefix+'-fc-q').textContent=c.q;
  document.getElementById(prefix+'-fc-a').textContent=c.a;
  document.getElementById(prefix+'-fc-src').textContent='— '+c.src;
  document.getElementById(prefix+'-fc-counter').textContent=s.current+1;
  document.getElementById(prefix+'-fc-total').textContent=s.queue.length;
  document.getElementById(prefix+'-fc-card').classList.remove('flipped');
  document.getElementById(prefix+'-fc-done').style.display='none';
  document.getElementById(prefix+'-fc-wrap').style.display='block';
}
function renderSRBar(prefix){
  const s=fcState[prefix];if(!s)return;
  const bar=document.getElementById(prefix+'-sr-bar');
  if(!bar)return;
  bar.innerHTML='<span style="font-size:12px;color:var(--text3);margin-right:6px">Progress:</span>';
  s.all.forEach(c=>{
    const pip=document.createElement('span');
    pip.className='sr-pip'+(c.confidence>=2?' know':c.confidence===1?' review':'');
    bar.appendChild(pip);
  });
  const known=s.all.filter(c=>c.confidence>=2).length;
  const total=s.all.length;
  const span=document.createElement('span');
  span.style.cssText='font-size:12px;color:var(--text3);margin-left:8px';
  span.textContent=known+'/'+total+' confident';
  bar.appendChild(span);
}
function flipFC(prefix){document.getElementById(prefix+'-fc-card').classList.toggle('flipped')}
function rateFC(prefix,rating){
  const s=fcState[prefix];if(!s)return;
  const card=s.queue[s.current];
  card.confidence=rating;
  s.current++;
  if(s.current>=s.queue.length){
    const weak=s.all.filter(c=>c.confidence<2);
    const known=s.all.filter(c=>c.confidence>=2).length;
    document.getElementById(prefix+'-fc-wrap').style.display='none';
    document.getElementById(prefix+'-fc-done').style.display='block';
    if(weak.length===0){document.getElementById(prefix+'-done-msg').textContent='You know all '+s.all.length+' cards — excellent work! 🎓'}
    else{document.getElementById(prefix+'-done-msg').textContent=known+' cards solid, '+weak.length+' still need work. Click "Review weak cards" to focus on those.'}
  }else{renderFC(prefix)}
  renderSRBar(prefix);
}
function reviewWeak(prefix){
  const s=fcState[prefix];
  const weak=s.all.filter(c=>c.confidence<2);
  if(weak.length===0){resetFC(prefix);return}
  s.queue=[...weak].sort(()=>Math.random()-.5);
  s.current=0;
  document.getElementById(prefix+'-fc-done').style.display='none';
  document.getElementById(prefix+'-fc-wrap').style.display='block';
  renderFC(prefix);
}
function shuffleFC(prefix){
  const s=fcState[prefix];if(!s)return;
  s.queue=[...s.all].sort(()=>Math.random()-.5);
  s.current=0;
  document.getElementById(prefix+'-fc-done').style.display='none';
  document.getElementById(prefix+'-fc-wrap').style.display='block';
  renderFC(prefix);
}
function resetFC(prefix){
  const s=fcState[prefix];if(!s)return;
  s.all.forEach(c=>c.confidence=1);
  buildQueue(prefix);
  document.getElementById(prefix+'-fc-done').style.display='none';
  document.getElementById(prefix+'-fc-wrap').style.display='block';
  renderFC(prefix);
  renderSRBar(prefix);
}

// ── Quiz data ──
const qDataMap={
  sv:[
    {q:"What is the revenue threshold for MNEs under BEPS Pillar 2?",opts:["€20 billion","€500 million","€750 million","€1 billion"],ans:2,exp:"Pillar 2 applies to MNE groups with annual consolidated revenues of at least €750 million — approximately 8,000 corporate groups globally.",topic:"BEPS"},
    {q:"Why is BEPS Pillar 1 currently blocked?",opts:["EU Parliament rejected it","The OECD withdrew the proposal","USA withdrew support under Trump","Developing countries voted against it"],ans:2,exp:"The USA withdrew its support under the Trump administration. Without the world's largest economy, global consensus on Pillar 1 collapsed. Many countries responded with unilateral digital service taxes.",topic:"BEPS"},
    {q:"Which EU directive implemented the global minimum tax (Pillar 2)?",opts:["ATAD","Directive 2022/2523","Directive 80/987","Single European Act"],ans:1,exp:"Directive 2022/2523 implemented Pillar 2 in the EU, entering into force on 31 December 2023. ATAD is a separate directive implementing other BEPS measures.",topic:"BEPS"},
    {q:"What does the QDMTT stand for and what is its role?",opts:["Qualified Domestic Minimum Tax Treaty — treaty provision","Qualified Domestic Minimum Top-up Tax — allows domestic top-up first","Quantified Direct Minimum Tax Threshold — sets the rate","Qualified Directive Minimum Transfer Tax — cross-border rule"],ans:1,exp:"QDMTT (Qualified Domestic Minimum Top-up Tax) allows a jurisdiction to apply the top-up tax to its own low-taxed entities first, before other countries can do so under IIR or UTPR.",topic:"BEPS"},
    {q:"How many aspects does the rule of law have under Art. 2 TEU?",opts:["4","5","6","7"],ans:2,exp:"Art. 2 TEU rule of law has 6 aspects: legality, legal certainty, prohibition of arbitrary executive power, effective judicial protection, separation of powers, equality before the law.",topic:"Legal Systems"},
    {q:"Which of these is NOT one of the 5 state principles of the German Basic Law?",opts:["Democracy","Federalism","Secularism","Sozialstaat"],ans:2,exp:"The 5 Grundgesetz principles are: Democracy, Rechtsstaat (rule of law), Republic, Federalism, Sozialstaat. Secularism (separation of church and state) is not one of the five core state principles.",topic:"Legal Systems"},
    {q:"The Council of Europe is…",opts:["The same as the European Council","An EU institution with 27 MS","A separate organisation with 46 MS including non-EU countries","The EU's legislative upper chamber"],ans:2,exp:"The Council of Europe is a completely separate intergovernmental organisation from the EU — it has 46 member states including many non-EU countries, and is home to the European Court of Human Rights.",topic:"Legal Systems"},
    {q:"When did the Treaty of Rome (EEC) enter into force?",opts:["1951","1957","1958","1965"],ans:2,exp:"The Treaties of Rome were signed on 25 March 1957 and entered into force on 1 January 1958. They established the EEC and Euratom.",topic:"EU History"},
    {q:"What were the Copenhagen Criteria (1993)?",opts:["Rules for eurozone membership","Rules for EU budget contributions","Conditions for EU accession: political, economic, and acquis criteria","Standards for Council of Europe membership"],ans:2,exp:"The Copenhagen Criteria (1993) set three conditions for EU accession: (1) political — stable institutions, rule of law, minority protection; (2) economic — functioning market economy; (3) acquis — ability to adopt all EU obligations.",topic:"EU History"},
    {q:"What is the difference between tax avoidance and tax evasion?",opts:["There is no legal difference","Avoidance is illegal, evasion is aggressive but legal","Avoidance is legal (may contradict legislative intent); evasion is illegal","Both are legal forms of tax planning"],ans:2,exp:"Tax avoidance is technically legal (though may be contrary to the spirit of the law). Tax evasion is illegal — deliberate misrepresentation or concealment. Between them lies 'aggressive tax planning'.",topic:"Tax"},
  ],
  svi:[
    {q:"Which case established the doctrine of Direct Effect?",opts:["Costa v. ENEL","Van Gend en Loos","Simmenthal","Francovich"],ans:1,exp:"Van Gend en Loos (1963) established that EU law can create rights for individuals which national courts must protect directly. The EEC was declared a 'new legal order of international law.'",topic:"Direct Effect"},
    {q:"What must a national court do when national law conflicts with EU law?",opts:["Wait for the constitutional court to rule","Refer the question to the ECJ first","Immediately disapply the conflicting national law","Apply national law if it was enacted later"],ans:2,exp:"Simmenthal (1978): national courts must immediately disapply conflicting national law. They do not need to wait for a constitutional court ruling, legislative repeal, or ECJ referral.",topic:"National Courts"},
    {q:"Which article governs the preliminary ruling procedure?",opts:["Art. 19 TEU","Art. 252 TFEU","Art. 267 TFEU","Art. 288 TFEU"],ans:2,exp:"Art. 267 TFEU. Courts of last instance must refer questions on EU law interpretation or validity to the ECJ. Lower courts may choose to refer. Only the ECJ can declare EU law invalid.",topic:"Procedure"},
    {q:"Francovich: Italy failed to implement a directive. What did the ECJ decide?",opts:["No liability — directives aren't directly binding","Individuals must sue their employer, not the state","Italy must compensate individuals who suffered damage from its failure","No remedy exists if the directive lacks direct effect"],ans:2,exp:"Francovich (1991): MS are liable to compensate individuals for damage caused by failure to implement EU law. This ensures directives remain effective even when not directly effective.",topic:"State Liability"},
    {q:"Can national constitutional law override EU law?",opts:["Yes — constitutions have the highest legal rank","Yes — but only for fundamental rights provisions","No — only the ECJ can declare EU law invalid","No — but national courts can suspend EU law temporarily"],ans:2,exp:"Internationale Handelsgesellschaft (1970): EU law cannot be reviewed against national constitutional law. The validity of EU law is judged only by EU law. Only the ECJ can declare EU law invalid.",topic:"Primacy"},
    {q:"Key difference between a Regulation and Directive under Art. 288 TFEU?",opts:["Regulations require unanimous Council vote; directives do not","Regulations are directly applicable; directives require MS implementation","Directives are binding; regulations are merely soft law","Regulations bind only MS governments; directives also bind individuals"],ans:1,exp:"A Regulation is directly applicable — binding in entirety, no national implementation needed. A Directive is binding only as to the result — MS chooses the form and method. This is the fundamental distinction.",topic:"Secondary Law"},
    {q:"What is the principle of conferral (Art. 5 TEU)?",opts:["EU law prevails over national law","EU institutions must act proportionately","The EU can only act where the Treaties explicitly grant competence","MS must implement directives faithfully"],ans:2,exp:"Art. 5 TEU: the EU has no inherent powers. All EU competence flows from explicit conferral in the Treaties. Powers not conferred on the EU remain with Member States.",topic:"EU Structure"},
    {q:"What are the 3 requirements for a provision to have direct effect?",opts:["Written, signed by all MS, and ratified","Clear, precise, and unconditional","Enacted by Council, approved by Parliament, published in OJ","Adopted unanimously, transposed correctly, applied uniformly"],ans:1,exp:"Van Gend en Loos: for direct effect, the provision must be (1) clear, (2) precise, (3) unconditional — meaning it creates a right that requires no further legislative action by MS.",topic:"Direct Effect"},
    {q:"Can an individual rely on a directive against a private company?",opts:["Yes, if the implementation deadline has passed","Yes, if the provision is clear, precise and unconditional","No — directives only have vertical direct effect (against the state)","Only if the company provides a public service"],ans:2,exp:"Directives have NO horizontal direct effect — an individual cannot rely on a directive against a private party. Only vertical direct effect (individual vs. state) is possible. For private-party situations: use indirect effect or Francovich.",topic:"Direct Effect"},
    {q:"Since Lisbon, what is the legal status of the Charter of Fundamental Rights?",opts:["Non-binding — it is soft law","Same legal value as the Treaties (primary law)","It is secondary law, below the Treaties","It applies only to EU institutions, not Member States"],ans:1,exp:"Art. 6(1) TEU: since the Lisbon Treaty (2009), the Charter has the same legal value as the TEU and TFEU — it is binding primary law. Before Lisbon: fundamental rights existed only as general principles (Internationale Handelsgesellschaft).",topic:"Fundamental Rights"},
    {q:"What double principle did Internationale Handelsgesellschaft establish?",opts:["Direct effect + primacy","Primacy over ordinary law + primacy over constitutional law","EU law cannot override constitutions + but must respect fundamental rights","Fundamental rights as general principles + state liability"],ans:2,exp:"IHG established two things: (1) primacy extends to national constitutional law — EU law cannot be reviewed against constitutions; AND (2) fundamental rights are general principles of EU law, drawn from MS constitutional traditions.",topic:"Fundamental Rights"},
    {q:"When does Francovich state liability apply instead of direct effect?",opts:["Always — they are interchangeable","When the directive is clear and unconditional","When direct effect is unavailable (content unclear or horizontal situation) but MS failed to implement","Only for regulations, not directives"],ans:2,exp:"Francovich applies as a fallback when direct effect is not available — e.g. the directive's content is not sufficiently identifiable, or the situation is horizontal (private vs. private). The individual then sues the MS instead.",topic:"State Liability"},
    {q:"What is 'indirect effect' (consistent interpretation)?",opts:["EU law indirectly applying through national courts","National courts must interpret national law in light of the directive's purpose","A directive with weaker binding force than a regulation","The ECJ indirectly reviewing national law via preliminary ruling"],ans:1,exp:"Indirect effect (Von Colson principle): national courts must interpret national law as far as possible in conformity with the directive's purpose — even when direct effect is unavailable. It bridges the gap between direct effect and Francovich.",topic:"Direct Effect"},
    {q:"Which case operationalised primacy by telling courts exactly what to do?",opts:["Van Gend en Loos","Costa v. ENEL","Simmenthal","Internationale Handelsgesellschaft"],ans:2,exp:"Simmenthal (1978). Costa said EU law prevails in theory. Simmenthal told national courts exactly what to do: immediately disapply conflicting national law, no waiting required.",topic:"National Courts"},
    {q:"What was the significance of the preliminary ruling procedure used in Van Gend and Costa?",opts:["It allowed national courts to override EU law","It gave the ECJ power to strike down national legislation","It allowed national courts to get uniform answers on EU law interpretation from the ECJ","It gave individuals direct access to the ECJ"],ans:2,exp:"Art. 267 TFEU (then Art. 177 EEC): the preliminary ruling procedure allowed Dutch and Italian courts to ask the ECJ how EU law should be interpreted — creating landmark principles that now apply across all MS.",topic:"Procedure"},
  ]
};

// ── Quiz engine with weak spots ──
const qState={};
function initQuiz(prefix){
  qState[prefix]={idx:0,score:0,answered:false,wrongs:[]};
  document.getElementById(prefix+'-quiz-wrap').style.display='block';
  document.getElementById(prefix+'-quiz-score').classList.remove('show');
  renderQ(prefix);
}
function renderQ(prefix){
  const s=qState[prefix];s.answered=false;
  const q=qDataMap[prefix][s.idx];const total=qDataMap[prefix].length;
  document.getElementById(prefix+'-q-meta').textContent='Question '+(s.idx+1)+' of '+total;
  document.getElementById(prefix+'-qpfill').style.width=(s.idx/total*100)+'%';
  document.getElementById(prefix+'-q-text').textContent=q.q;
  document.getElementById(prefix+'-q-fb').className='quiz-fb';
  document.getElementById(prefix+'-q-next').style.display='none';
  const opts=document.getElementById(prefix+'-q-opts');opts.innerHTML='';
  q.opts.forEach((o,i)=>{const b=document.createElement('button');b.className='quiz-opt';b.textContent=o;b.onclick=()=>answerQ(prefix,i,b);opts.appendChild(b)});
}
function answerQ(prefix,i,btn){
  const s=qState[prefix];if(s.answered)return;s.answered=true;
  const q=qDataMap[prefix][s.idx];
  const fb=document.getElementById(prefix+'-q-fb');
  document.querySelectorAll('#'+prefix+'-q-opts .quiz-opt').forEach(b=>b.disabled=true);
  if(i===q.ans){btn.classList.add('correct');s.score++;}
  else{btn.classList.add('wrong');document.querySelectorAll('#'+prefix+'-q-opts .quiz-opt')[q.ans].classList.add('correct');s.wrongs.push(q);}
  fb.className='quiz-fb '+(i===q.ans?'correct':'wrong')+' show';
  fb.innerHTML='<strong>'+(i===q.ans?'Correct!':'Not quite.')+'</strong> '+q.exp;
  document.getElementById(prefix+'-q-next').style.display='block';
}
function nextQ(prefix){
  const s=qState[prefix];s.idx++;
  const total=qDataMap[prefix].length;
  if(s.idx>=total){
    document.getElementById(prefix+'-quiz-wrap').style.display='none';
    const sc=document.getElementById(prefix+'-quiz-score');sc.classList.add('show');
    document.getElementById(prefix+'-score-big').textContent=s.score+'/'+total;
    const pct=s.score/total;
    document.getElementById(prefix+'-score-msg').textContent=pct>=.9?'Outstanding — exam ready! 🎓':pct>=.7?'Solid! A few gaps to close.':pct>=.5?'Good start — review the weak spots below.':'Keep studying — focus on the highlighted topics.';
    document.getElementById(prefix+'-qpfill').style.width='100%';
    renderWeakSpots(prefix);
  }else renderQ(prefix);
}
function renderWeakSpots(prefix){
  const s=qState[prefix];
  const weakSection=document.getElementById(prefix+'-weak-section');
  if(!weakSection)return;
  if(s.wrongs.length===0){weakSection.innerHTML='<div class="weak-title">💪 Perfect score — no weak spots!</div>';return;}
  const topics=[...new Set(s.wrongs.map(q=>q.topic))];
  const correctTopics=[...new Set(qDataMap[prefix].filter(q=>!s.wrongs.includes(q)).map(q=>q.topic))].filter(t=>!topics.includes(t));
  let html='<div class="weak-title">Focus on these topics:</div>';
  topics.forEach(t=>{
    const tips={
      'BEPS':'Review the Pillar 1 vs Pillar 2 comparison table',
      'Direct Effect':'Go back to Van Gend requirements + vertical vs horizontal distinction',
      'Primacy':'Review Costa + Internationale Handelsgesellschaft in the timeline',
      'State Liability':'Focus on the 3 Francovich conditions',
      'National Courts':'Review Simmenthal — when courts must act immediately',
      'Fundamental Rights':'Review Internationale Handelsgesellschaft double principle',
      'Secondary Law':'Use the Art. 288 comparison table',
      'Legal Systems':'Review the rule of law 6 aspects',
      'EU History':'Go through the timeline in the summary',
      'Tax':'Review tax avoidance vs evasion distinction',
    };
    html+='<div class="weak-item"><span class="weak-item-icon">⚠️</span><div><div class="weak-item-text">'+t+'</div><div class="weak-item-tip">'+(tips[t]||'Review this topic in the summary and flashcards')+'</div></div></div>';
  });
  if(correctTopics.length>0){
    html+='<div class="strong-section"><div class="weak-title" style="margin-top:12px">Strong areas ✓</div>';
    correctTopics.slice(0,3).forEach(t=>{html+='<div class="strong-item"><span>✓</span><span class="strong-item-text">'+t+'</span></div>'});
    html+='</div>';
  }
  weakSection.innerHTML=html;
}
function restartQuiz(prefix){initQuiz(prefix)}

// ── Decision Tree / Case Analyser ──
const scenarios=[
  {
    desc:'<strong>Scenario A:</strong> A Dutch company imports goods from Germany. The Dutch government raised the customs duty on their product from 3% to 8% after the EEC Treaty came into force. The company believes this violates EU law and wants to challenge it in a Dutch court.',
    steps:[
      {q:'Does the EU Treaty provision at issue (Art. 30 TFEU — no customs duties) directly apply to this situation?',opts:['Yes — it is clear, precise and unconditional','No — it needs national implementation first'],next:[1,999],chose:[]},
      {q:'Can the company rely on this provision directly in the Dutch national court?',opts:['Yes — it has direct effect (Van Gend en Loos)','No — only MS can invoke Treaty provisions'],next:[2,998],chose:[]},
      {q:'The Dutch court must apply the EU provision. Is there conflicting Dutch national law?',opts:['Yes — the raised duty law conflicts with Art. 30 TFEU','No — the laws are compatible'],next:[3,997],chose:[]},
      {q:'What must the Dutch court do (Simmenthal)?',opts:['Immediately disapply the conflicting Dutch law','Wait for the Dutch Constitutional Court to rule','Refer to ECJ and await answer before acting','Apply Dutch law — it is more recent'],next:['result-a',998,998,998],chose:[]},
    ],
    results:{
      'result-a':{title:'Correct outcome: Direct Effect + Simmenthal',body:'The company wins. Art. 30 TFEU has direct effect (Van Gend en Loos, 1963) — it is clear, precise, and unconditional. The Dutch court must immediately disapply the conflicting national duty law (Simmenthal, 1978). No waiting for constitutional court or legislature.',articles:['Art. 30 TFEU','Van Gend en Loos (1963)','Simmenthal (1978)']},
      '999':{title:'Incorrect — try again',body:'If the provision requires further implementation, it cannot have direct effect. But Art. 30 TFEU is clear and unconditional — no action by MS is needed. This provision does have direct effect.'},
    }
  },
  {
    desc:'<strong>Scenario B:</strong> Italy passes a new national law that directly contradicts an existing EU Regulation. An Italian court is hearing a case where this conflict is decisive. The Italian government argues the national law, being more recent, should prevail.',
    steps:[
      {q:'Under EU law, can a later national law override an earlier EU Regulation?',opts:['Yes — national laws are supreme in their own legal system','No — EU law has primacy over all national law (Costa v. ENEL)'],next:[999,1],chose:[]},
      {q:'What is the legal basis for EU law\'s primacy over national law?',opts:['It is written into the Italian Constitution','MS permanently limited their sovereign rights when joining the EU (Costa)','The EU Parliament voted for primacy','National courts decided this on their own'],next:[998,2,998,998],chose:[]},
      {q:'Does primacy apply even to the Italian Constitution, or only to ordinary legislation?',opts:['Only to ordinary legislation — constitutions are protected','To ALL national law including constitutional law (Internationale Handelsgesellschaft)'],next:[998,3],chose:[]},
      {q:'What must the Italian court do with the conflicting Italian law?',opts:['Disapply it immediately — no waiting required (Simmenthal)','Refer to the Italian Constitutional Court first','Pass the case to the ECJ and suspend proceedings','Apply Italian law — constitutional courts have final say'],next:['result-b',998,998,998],chose:[]},
    ],
    results:{
      'result-b':{title:'Correct outcome: Primacy + Simmenthal',body:'EU law prevails. The Regulation takes precedence over the later Italian law (Costa v. ENEL, 1964). Primacy extends even to constitutional law (Internationale Handelsgesellschaft, 1970). The Italian court must immediately disapply the conflicting Italian law without waiting for any other institution (Simmenthal, 1978).',articles:['Costa v. ENEL (1964)','Int\'l Handelsgesellschaft (1970)','Simmenthal (1978)']},
      '999':{title:'Incorrect',body:'Under EU law, primacy means EU law prevails over ALL conflicting national law — including more recent legislation. Costa v. ENEL (1964) established this principle definitively.'},
    }
  },
  {
    desc:'<strong>Scenario C:</strong> The EU issued Directive 80/987 requiring MS to create a guarantee fund protecting employees\' wages if their employer goes insolvent. Italy failed to implement this directive by the 1983 deadline. In 1990, Andrea Francovich\'s employer went bankrupt. He is owed unpaid wages but there is no guarantee fund. He wants a legal remedy.',
    steps:[
      {q:'Can Francovich rely on the directive directly against the Italian state (vertical direct effect)?',opts:['Yes — if the directive\'s content is sufficiently clear','No — the content of the fund was not sufficiently identifiable for direct effect'],next:[998,1],chose:[]},
      {q:'Even without direct effect, does Francovich have any remedy?',opts:['No — if no direct effect, no remedy exists','Yes — Francovich can claim compensation from the Italian state (state liability)'],next:[999,2],chose:[]},
      {q:'What are the 3 conditions for state liability (Francovich)?',opts:['Directive grants rights + content identifiable + causal link between breach and damage','Clear provision + deadline lapsed + individual suffered loss','MS failed to implement + individual sued + court agrees','Regulation directly applicable + MS at fault + ECJ confirms'],next:[3,998,998,998],chose:[]},
      {q:'Italy\'s failure to create the fund caused Francovich\'s loss. The 3 conditions are met. What is the outcome?',opts:['Italy must compensate Francovich for his lost wages','Italy escapes liability — it can choose when to implement directives','Francovich must wait until Italy eventually implements the directive','The ECJ pays compensation directly'],next:['result-c',999,999,999],chose:[]},
    ],
    results:{
      'result-c':{title:'Correct outcome: State Liability (Francovich)',body:'Italy must compensate Francovich. The 3 Francovich conditions are met: (1) the directive grants rights to employees, (2) the content of those rights is identifiable, (3) there is a direct causal link between Italy\'s failure and Francovich\'s loss. Without this remedy, directives would lose their binding force.',articles:['Francovich (1991)','Art. 288(3) TFEU']},
      '999':{title:'Incorrect',body:'Without direct effect, Francovich is not without a remedy. Francovich (1991) established that MS must compensate individuals for damage caused by failure to implement EU law — this is state liability.'},
    }
  },
  {
    desc:'<strong>Scenario D:</strong> A German company faces forfeiture of its export licence deposit under an EU Regulation. The German Administrative Court believes the regulation violates the right to property under the German Basic Law (Art. 14 GG). It wants to declare the EU regulation invalid.',
    steps:[
      {q:'Can the German court review EU law against the German Constitution?',opts:['Yes — the Basic Law is the supreme law in Germany','No — EU law can only be reviewed against EU law itself (Internationale Handelsgesellschaft)'],next:[999,1],chose:[]},
      {q:'Who has the power to declare EU law invalid?',opts:['Any national court, including the German Administrative Court','Only the ECJ — via the preliminary ruling procedure (Art. 267 TFEU)','The German Federal Constitutional Court','The EU Commission'],next:[998,2,998,998],chose:[]},
      {q:'BUT — does EU law protect fundamental rights at all?',opts:['No — fundamental rights only exist at national level','Yes — fundamental rights are general principles of EU law (Internationale Handelsgesellschaft)'],next:[999,3],chose:[]},
      {q:'So what should the German court do?',opts:['Apply German constitutional law and invalidate the regulation','Disapply the regulation and compensate the company','Refer to the ECJ via preliminary ruling (Art. 267 TFEU) asking whether the regulation violates fundamental rights as general principles of EU law','Refer to the German Federal Constitutional Court'],next:['result-d',998,'result-d',998],chose:[]},
    ],
    results:{
      'result-d':{title:'Correct outcome: Referral to ECJ + Fundamental Rights as General Principles',body:'The German court cannot itself invalidate EU law. Only the ECJ can do that (monopoly on EU law invalidity). The court should refer to the ECJ via Art. 267 TFEU. The ECJ will assess whether the regulation violates fundamental rights as general principles of EU law — a protection it recognises since Internationale Handelsgesellschaft (1970), now codified in the Charter.',articles:['Internationale Handelsgesellschaft (1970)','Art. 267 TFEU','Art. 6(1) TEU — Charter']},
    }
  }
];

let currentScenario=0,dtreeState=[];
function loadScenario(idx,btn){
  currentScenario=idx;
  document.querySelectorAll('.scenario-btn').forEach(b=>b.classList.remove('active'));
  if(btn)btn.classList.add('active');
  const sc=scenarios[idx];
  document.getElementById('scenario-desc').innerHTML=sc.desc;
  dtreeState=sc.steps.map(()=>({answered:false,choice:-1}));
  renderDTree();
}
function renderDTree(){
  const sc=scenarios[currentScenario];
  const container=document.getElementById('dtree-container');
  let html='';
  let activeFound=false;
  sc.steps.forEach((step,i)=>{
    const state=dtreeState[i];
    const prevDone=i===0||dtreeState[i-1].answered;
    if(!prevDone)return;
    const isActive=!state.answered&&!activeFound;
    if(isActive)activeFound=true;
    const cls=state.answered?'done-step':isActive?'active-step':'';
    html+='<div class="dt-step '+cls+'">';
    html+='<div class="dt-num">'+(i+1)+'</div>';
    html+='<div class="dt-q">'+step.q+'</div>';
    if(!state.answered){
      html+='<div class="dt-opts">';
      step.opts.forEach((o,j)=>{html+='<button class="dt-opt" onclick="chooseDT('+i+','+j+')">'+o+'</button>'});
      html+='</div>';
    }else{
      html+='<div class="dt-opts"><button class="dt-opt selected">'+step.opts[state.choice]+'</button></div>';
      const next=step.next[state.choice];
      if(typeof next==='string'&&sc.results[next]){
        const res=sc.results[next];
        html+='<div class="dt-result"><h3>'+res.title+'</h3><p>'+res.body+'</p>';
        if(res.articles)res.articles.forEach(a=>{html+='<span class="dt-article">'+a+'</span>'});
        html+='</div>';
      }
    }
    html+='</div>';
    if(i<sc.steps.length-1&&prevDone)html+='<div class="dt-connector">↓</div>';
  });
  html+='<div class="dt-reset-bar"><button class="btn btn-sm" onclick="loadScenario(currentScenario,null)">↺ Restart scenario</button></div>';
  container.innerHTML=html;
}
function chooseDT(stepIdx,optIdx){
  const sc=scenarios[currentScenario];
  dtreeState[stepIdx]={answered:true,choice:optIdx};
  const next=sc.steps[stepIdx].next[optIdx];
  if(typeof next==='number'&&next<sc.steps.length&&next>=0){
    // proceed to next step — already handled by renderDTree checking previous
  }
  renderDTree();
}

// ── Init ──
loadScenario(0,null);
</script>
</body>
</html>
