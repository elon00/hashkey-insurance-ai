# HashKey Insurance AI ($HKINS)
[![CI/CD Pipeline](https://github.com/elon00/hashkey-insurance-ai/actions/workflows/ci-cd-pipeline.yml/badge.svg)](https://github.com/elon00/hashkey-insurance-ai/actions/workflows/ci-cd-pipeline.yml)
[![Reality Check](https://img.shields.io/badge/Reality%20Check-100%2F100%20GENUINE%20GREEN-emerald.svg)](tests/reality_check_harness.py)
[![PQC Standard](https://img.shields.io/badge/NIST-FIPS%20203%2F204-purple.svg)]()
[![Blockchain](https://img.shields.io/badge/Blockchain-HashKey%20Chain%20(EVM)-blue.svg)]()

> **Autonomous Institutional RWA & DeFi Exploit Parametric Insurance, ZK-KYC Verified Underwriting, and Automated Liquidity Protection on HashKey Chain.**

---

## 🏛️ Project Profile
- **Project Identity:** HashKey Insurance AI
- **Asset Ticker:** $HKINS
- **Core Theme:** Institutional RWA & DeFi Exploit Parametric Insurance
- **Blockchain:** HashKey Chain (EVM)
- **Smart Contract:** `HashKeyParametricInsurance.sol`

---

## 🚀 Key Features
- **Deterministic 64-bit Conway Engine:** Non-linear invariant state machine in zero-dependency Rust (`src/main.rs`).
- **Native Smart Contract:** `HashKeyParametricInsurance.sol` enforcing non-custodial parametric insurance and solvency invariants.
- **Agentic Actuary Service:** Autonomous Python client in `src/hashkey_actuary_agent.py`.
- **Interactive QUX Launchpad:** Responsive dashboard with live Conway visualizer and Web4 QR generator (`index.html`).
- **Model Context Protocol (MCP):** 2 native tools exposed via `mcp.json`.

---

## 🧪 Testing & Verification
```bash
# Run 5-Gate Reality Check Test Harness
python tests/reality_check_harness.py

# Run Unit & Integrity Test Suite
python -m unittest discover tests
```
