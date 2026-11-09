const fs = require("node:fs");
const path = require("node:path");

const dir = __dirname;
const files = fs
  .readdirSync(dir)
  .filter((f) => /^\d\d-.+\.md$/.test(f))
  .sort();

const esc = (s) =>
  String(s)
    .replace(/&/g, "&amp;")
    .replace(/</g, "&lt;")
    .replace(/>/g, "&gt;")
    .replace(/"/g, "&quot;");

const cards = files.map((f, i) => {
  let html = Bun.markdown.html(fs.readFileSync(path.join(dir, f), "utf8"));
  html = html.replace(/href="(\d\d)-[^"]+\.md"/g, (_, n) => `href="#p${Number(n) + 1}"`);
  const h1 = html.match(/<h1[^>]*>([\s\S]*?)<\/h1>/);
  const title = h1 ? h1[1].replace(/<[^>]+>/g, "").trim() : f;
  const short = title.match(/^\d+\s*\/\s*14/);
  return {
    html,
    label: short ? short[0].replace(/\s+/g, " ") : title,
    id: `p${i + 1}`,
  };
});

const sections = cards
  .map((c) => `<section id="${c.id}" data-label="${esc(c.label)}">${c.html}</section>`)
  .join("\n");

const page = `<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, viewport-fit=cover">
<meta name="theme-color" content="#7D2035">
<title>Cue cards</title>
<style>
  html, body { margin: 0; height: 100%; }
  body {
    background: #fff; color: #1A1A1A;
    font-family: system-ui, -apple-system, "Segoe UI", Roboto, sans-serif;
    font-size: clamp(17px, 4.3vw, 21px); line-height: 1.5;
    -webkit-text-size-adjust: 100%;
  }
  #deck {
    display: flex; height: 100vh; height: 100dvh;
    overflow-x: auto; overflow-y: hidden;
    scroll-snap-type: x mandatory; overscroll-behavior-x: contain;
    scrollbar-width: none;
  }
  #deck::-webkit-scrollbar { display: none; }
  section {
    flex: 0 0 100%; height: 100vh; height: 100dvh;
    overflow-y: auto; scroll-snap-align: start; scroll-snap-stop: always;
    box-sizing: border-box;
    padding: calc(58px + env(safe-area-inset-top)) 22px calc(48px + env(safe-area-inset-bottom));
  }
  h1 { font-size: 1.2em; color: #7D2035; line-height: 1.25; margin: 0 0 1rem; }
  h1::after {
    content: ""; display: block; width: 2.2rem; height: 3px;
    background: #FFD100; margin-top: .45rem;
  }
  h2 { font-size: .95em; color: #7D2035; margin: 1.3rem 0 .35rem; }
  p { margin: .6em 0; }
  ul { padding-left: 1.15em; margin: .5em 0; }
  li { margin: .45em 0; }
  li::marker { color: #7D2035; }
  a { color: #7D2035; }
  #bar {
    position: fixed; top: 0; left: 0; right: 0; z-index: 2;
    display: flex; align-items: center; justify-content: space-between;
    height: calc(44px + env(safe-area-inset-top));
    padding: env(safe-area-inset-top) 18px 0;
    box-sizing: border-box;
    background: rgba(255, 255, 255, .97);
    border-bottom: 1px solid #E6D9DD;
    font-size: 12px; letter-spacing: .02em; color: #7D2035;
  }
  #bar span:first-child { text-transform: uppercase; }
  #label { font-variant-numeric: tabular-nums; }
  #progress {
    position: fixed; left: 0; bottom: 0; height: 3px; width: 0;
    background: #FFD100; z-index: 2; transition: width .15s linear;
  }
  #hint {
    position: fixed; left: 50%; transform: translateX(-50%);
    bottom: calc(14px + env(safe-area-inset-bottom));
    font-size: 12px; color: #8C8C8C; z-index: 2;
    transition: opacity .4s;
  }
  @media (prefers-color-scheme: dark) {
    body { background: #fff; color: #1A1A1A; }
  }
</style>
</head>
<body>
<div id="bar"><span>Cue cards</span><span id="label"></span></div>
<div id="deck">
${sections}
</div>
<div id="progress"></div>
<div id="hint">Swipe</div>
<script>
  const deck = document.getElementById("deck");
  const secs = [...deck.children];
  const label = document.getElementById("label");
  const bar = document.getElementById("progress");
  const hint = document.getElementById("hint");
  let raf = 0;
  let touched = false;

  function idx() {
    return Math.round(deck.scrollLeft / Math.max(1, deck.clientWidth));
  }
  function sync() {
    const i = Math.min(secs.length - 1, Math.max(0, idx()));
    label.textContent = secs[i].dataset.label || "";
    bar.style.width = ((i + 1) / secs.length) * 100 + "%";
    if (location.hash !== "#" + secs[i].id) {
      history.replaceState(null, "", "#" + secs[i].id);
    }
    if (touched || i > 0) hint.style.opacity = 0;
  }
  function go(i, smooth) {
    i = Math.max(0, Math.min(secs.length - 1, i));
    touched = true;
    deck.scrollTo({ left: i * deck.clientWidth, behavior: smooth ? "smooth" : "auto" });
  }

  deck.addEventListener("scroll", () => {
    cancelAnimationFrame(raf);
    raf = requestAnimationFrame(sync);
  }, { passive: true });

  addEventListener("keydown", (e) => {
    if (e.key === "ArrowRight" || e.key === "PageDown") { e.preventDefault(); go(idx() + 1, true); }
    if (e.key === "ArrowLeft" || e.key === "PageUp") { e.preventDefault(); go(idx() - 1, true); }
  });

  deck.addEventListener("click", (e) => {
    const a = e.target.closest('a[href^="#p"]');
    if (!a) return;
    e.preventDefault();
    go(Number(a.getAttribute("href").slice(2)) - 1, true);
  });

  addEventListener("resize", () => go(idx(), false));

  const m = location.hash.match(/^#p(\\d+)/);
  if (m) go(Number(m[1]) - 1, false);
  sync();
</script>
</body>
</html>
`;

fs.writeFileSync(path.join(dir, "deck.html"), page);
console.log(`built deck.html from ${cards.length} cards`);
