# Bill of Quantity (BOQ) - Production Azure Environment
**Region**: UAE North (`uaenorth`)  
**Currency**: USD ($)  
**Period**: Monthly & Estimated Annual Costs  

---

## 1. Executive Cost Summary

| Resource Category | Estimated Monthly Cost (USD) | Estimated Annual Cost (USD) |
| :--- | :--- | :--- |
| **Compute - Azure Kubernetes Service (AKS)** | $490.50 | $5,886.00 |
| **Container Registry - Azure Container Registry (ACR)** | $50.00 | $600.00 |
| **Secrets Management - Azure Key Vault** | $5.00 | $60.00 |
| **Web Hosting - Azure App Service (P1v3)** | $167.90 | $2,014.80 |
| **Networking & Data Transfer** | $15.90 | $190.80 |
| **Monitoring & Observability (Log Analytics & App Insights)** | $69.00 | $828.00 |
| **Security & Compliance (Defender for Cloud)** | $89.00 | $1,068.00 |
| **TOTAL ESTIMATED COST** | **$887.30 / month** | **$10,647.60 / year** |

---

## 2. Detailed Resource Breakdown

### A. Azure Kubernetes Service (AKS)
* **Control Plane SLA**: Included (Standard Cluster Uptime SLA: $73.00/month optional for 99.95% SLA).
* **Node Pool VM Instances**: 3 x `Standard_D4s_v5` (4 vCPU, 16 GiB RAM, 50 GB OS Disk)
  * Hourly Rate (UAE North): ~$0.224 / hour
  * Monthly Cost per node: ~$163.50
  * **3 Nodes Total**: **$490.50 / month**
* **Managed OS Disks**: 3 x 32 GB Premium SSD (P4) = Included in node compute rate / ~$14.40 total.

### B. Azure Container Registry (ACR)
* **Tier**: Premium Tier (Supports Private Endpoints, Dedicated Subdomain, Geo-Replication)
* **Included Storage**: 500 GB
* **Fixed Daily Unit**: $1.667 / day
* **Total ACR Cost**: **$50.00 / month**

### C. Azure Key Vault
* **Tier**: Standard
* **Secret / Key Operations**: ~100k operations / month ($0.03 / 10k ops = $0.30)
* **Key Vault Instances**: 1 Vault ($5.00 base storage + operations)
* **Total Key Vault Cost**: **$5.00 / month**

### D. Azure App Service
* **Plan Tier**: Premium V3 (`P1v3`) - Linux (2 vCPU, 8 GiB RAM)
* **VNet Integration**: Included
* **Monthly Unit Cost**: **$167.90 / month**

### E. Networking & Load Balancing
* **Public IP Addresses**: 2 x Standard Public IPs (Load Balancer & Ingress) = ~$7.20 / month
* **Egress Data Transfer**: ~100 GB Outbound Data Transfer (First 5 GB Free, $0.087/GB in UAE) = ~$8.70 / month
* **Total Networking Cost**: **$15.90 / month**

### F. Monitoring & Observability
* **Log Analytics Workspace**: Pay-As-You-Go Tier
  * Ingestion Volume: ~30 GB / month (~1 GB/day from AKS audit, app logs, metrics)
  * UAE North Ingestion Rate: ~$2.76 / GB (First 5 GB free) = 25 GB * $2.76 = ~$69.00 / month
* **Application Insights**: Included with Log Analytics Workspace telemetry integration.
* **Total Monitoring Cost**: **$69.00 / month**

### G. Security & Compliance
* **Microsoft Defender for Containers**:
  * 3 Nodes (12 vCPUs) @ ~$7.00 / vCPU / month = **$84.00 / month**
* **Microsoft Defender for Key Vault**:
  * Security monitoring on Key Vault access requests = **$5.00 / month**
* **Total Security Cost**: **$89.00 / month**

---

## 3. Cost Optimization Recommendations (Interview Talking Points)

1. **Reserved Instances (RI)**:
   * Committing to a **3-Year Azure Reserved Instance** for `Standard_D4s_v5` nodes in UAE North reduces node compute costs by up to **50-60%** (reducing monthly AKS node costs from $490.50 to ~$220.00).
2. **Auto-Scaling / HPA**:
   * Min node count set to 3 across 3 Availability Zones for HA, scaling dynamically up to 6 nodes during peak traffic.
3. **Log Analytics Data Retention**:
   * Set log retention to 30 days for operational logs, archiving historical logs to low-cost Azure Blob Storage (Cool/Archive tier) for compliance.
