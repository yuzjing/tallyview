# 📊 TallyView

<p align="left">
  <a href="README.md">English</a> | <b>简体中文</b>
</p>

> 开箱即用、轻量级的 [Fava](https://github.com/beancount/fava) & [Beancount](https://beancount.github.io/) 高级财务可视化与分析套件。内置精选社区顶级插件，专为多维财务看板、ECharts 图表大屏与自动化复式记账打造。

[![Python Version](https://img.shields.io/badge/Python-3.12--Alpine-3776AB?style=flat&logo=python)](https://python.org/)
[![License: MIT](https://img.shields.io/badge/License-MIT-green.svg)](LICENSE)
[![Container Image](https://img.shields.io/badge/GHCR-tallyview-blue?logo=docker)](https://github.com/yuzjing/tallyview/pkgs/container/tallyview)

---

## ✨ 核心特性


- **开箱即用全家桶**：预装 Beancount 生态官方与社区顶级扩展，包括 `fava-dashboards`（ECharts 自定义大屏）、`fava-envelope`（信封预算法）与 `fava-portfolio-returns`（真实投资收益率 IRR/TWR）。
- **自动化记账增强**：内置 Beancount 官方 `auto_accounts`（新科目自动免报错开户）与 `beancount_reds_plugins`（大额年费按月自动分摊 `amortize_over`），彻底消灭未开户报错与月度损益表失真。
- **极致轻量与低资源消耗**：基于 Alpine Linux 精简构建（镜像仅 ~50MB，运行内存仅 ~35MB），完美适配 1C1G 资源受限型 VPS。
- **双星生态协同**：专为配合 [TallyMind](https://github.com/yuzjing/tallymind)（基于 Go 的多模态 AI 记账 Agent）提供实时可视化数据看板。

---

## 📦 预装插件清单

| 插件 / 扩展名称 | 来源与分类 | 核心价值 |
| :--- | :--- | :--- |
| **`fava-dashboards`** | PyPI / 数据可视化 | 支持用 YAML 配置丰富的 ECharts 交互式图表大屏。 |
| **`fava-envelope`** | PyPI / 预算规划 | 引入 YNAB 信封预算法，实时掌握剩余可用预算。 |
| **`fava-portfolio-returns`** | PyPI / 投资分析 | 计算时间加权（TWR）与资金加权（IRR/年化）真实回报率。 |
| **`beancount.plugins.auto_accounts`** | 官方内置 / 自动化规则 | 原生自动为新科目声明开户，彻底消除未开户语法报错。 |
| **`beancount_reds_plugins`** | PyPI / 账目分摊 | 支持大额年费/租金跨 12 个月均匀平摊 (`amortize_over`)。 |

## ⚡ 快速开始

### 容器运行 (Podman / Docker)

```bash
podman run -d \
  --name tallyview \
  --restart always \
  -p 5000:5000 \
  -v /srv/tallymind/data:/data \
  ghcr.io/yuzjing/tallyview:latest
```

在浏览器打开 `http://localhost:5000` 即可直接进入交互财务控制台。

---

## 🤝 与 TallyMind 协同运作

* **输入端 ([TallyMind - Go](https://github.com/yuzjing/tallymind))**：在微信中通过发文字、小票截图完成实时多模态解析并存入 Beancount 账本。
* **展现端 (TallyView - Python)**：共享读取该账本，实时渲染资产大屏、损益表与预算看板。

---

## 📄 开源协议

本项目采用 [MIT License](LICENSE) 协议开源。
