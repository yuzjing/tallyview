# 📊 TallyView

<p align="left">
  <b>English</b> | <a href="README_zh.md">简体中文</a>
</p>

> A curated, batteries-included, lightweight distribution of [Fava](https://github.com/beancount/fava) and [Beancount](https://beancount.github.io/), optimized for multi-dimensional financial analytics, ECharts dashboards, and automated bookkeeping workflows.

[![Go Version](https://img.shields.io/badge/Python-3.12--Alpine-3776AB?style=flat&logo=python)](https://python.org/)
[![License: MIT](https://img.shields.io/badge/License-MIT-green.svg)](LICENSE)
[![Container Image](https://img.shields.io/badge/GHCR-tallyview-blue?logo=docker)](https://github.com/yuzjing/tallyview/pkgs/container/tallyview)

---

## ✨ Highlights

- **Batteries-Included Suite**: Pre-installed with top-tier Plain-Text Accounting (PTA) extensions including `fava-dashboards` (ECharts), `fava-envelope` (YNAB-style budgeting), `beantab` (spreadsheet reconciliation), and `fava-portfolio-returns` (IRR/TWR metrics).
- **Zero Configuration Boilerplate**: Bundles `auto_accounts` and `amortize_over` plugins out of the box—no more syntax errors on undeclared accounts or distorted annual subscription expenses.
- **Ultra-Lightweight & Low Resource Footprint**: Built on Alpine Linux.
- **Seamless Ecosystem Pairing**: Designed as the dedicated visual cockpit for [TallyMind](https://github.com/yuzjing/tallymind) (the Go-based multimodal AI bookkeeping agent).

---

## 📦 Pre-Bundled Plugins & Extensions

| Extension / Plugin | Category | Purpose |
| :--- | :--- | :--- |
| **`fava-dashboards`** | Visualization | Customizable ECharts visual dashboards via YAML. |
| **`fava-envelope`** | Budgeting | Envelope (YNAB-style) budget tracking with visual bars. |
| **`beantab`** | Reconciliation | Spreadsheet interface inside Fava for balance assertions. |
| **`fava-portfolio-returns`** | Investment | Time-Weighted (TWR) and Money-Weighted (IRR) return rates. |
| **`beancount-lazy-plugins`** | Core Automation | Dynamic `auto_accounts` on-the-fly declaration. |
| **`beancount_reds_plugins`** | Amortization | Spreading annual expenses (`amortize_over`) over 12 months. |
| **`beancount-share`** | Expense Sharing | Automatic split-bill handling and settlement tracking. |

---

## ⚡ Quick Start

### Run with Podman / Docker

```bash
podman run -d \
  --name tallyview \
  --restart always \
  -p 5000:5000 \
  -v /path/to/your/data:/data \
  ghcr.io/yuzjing/tallyview:latest
```

Open `http://localhost:5000` in your browser to view your financial cockpit.

---

## 🤝 Pairing with TallyMind

When deployed alongside **TallyMind**:
1. **Input Agent (TallyMind - Go)**: Ingests transactions via chat, voice, and receipt OCR into Beancount `.bean` files.
2. **Visual Dashboard (TallyView - Python)**: Ingests the same `.bean` files to render real-time charts and reports.

---

## 📄 License

This project is licensed under the [MIT License](LICENSE).
