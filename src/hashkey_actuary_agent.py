# -*- coding: utf-8 -*-
import hashlib
import time
import json

class HashKeyInsuranceActuary:
    def __init__(self, treasury_id: str = "hashkey_institution_vault"):
        self.treasury_id = treasury_id

    def quote_and_underwrite(self, asset_value: float, risk_score: float, zk_kyc_id: str) -> dict:
        premium_rate = 0.025 + (risk_score * 0.01)
        premium = asset_value * premium_rate
        policy_id = hashlib.sha256(f"{zk_kyc_id}:{asset_value}:{time.time()}".encode()).hexdigest()[:16]
        return {
            "policy_id": f"HK-POL-{policy_id}",
            "chain": "HashKey Chain (EVM)",
            "asset_value": asset_value,
            "calculated_premium": round(premium, 2),
            "zk_kyc_verified": True,
            "payout_guarantee": "HashKey Institutional Treasury",
            "timestamp": int(time.time())
        }

if __name__ == "__main__":
    actuary = HashKeyInsuranceActuary()
    res = actuary.quote_and_underwrite(100000.0, 1.4, "ZK_KYC_HASHKEY_INSTITUTION_991")
    print("HashKey Insurance Quote:", json.dumps(res, indent=2))
