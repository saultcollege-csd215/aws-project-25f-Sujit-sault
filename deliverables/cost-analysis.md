# AWS Cost Analysis
## Monthly Cost Estimate:

### EC2 Instance (t2.nano):
- Hourly rate: $0.006
- Hours per month: 730 (24/7)
- **Monthly cost: $4.38**

### Lambda Function (Python 3.9):
- Requests: $0.20 per 1 million requests
- Compute: $0.0000166667 per GB-second
- Memory: 128MB (0.125 GB)
- Average duration: 100ms (0.1 seconds)
- Compute per request: 0.125 GB × 0.1 seconds × $0.0000166667 = $0.0000002083
- Request cost: $0.00000020
- **Total per request: $0.0000004083**

### DynamoDB (PAY_PER_REQUEST):
- Write request units: $1.25 per million
- Read request units: $0.25 per million  
- **Estimated: < $1.00/month** (low usage)

## Break-even Analysis:
- EC2 monthly fixed cost: $4.38
- Lambda variable cost per request: $0.0000004083
- **Break-even point:** $4.38 ÷ $0.0000004083 = **10,730,000 requests/month**
## Recommendation:
- **Use Lambda** for low traffic (< 10 million requests/month)
- **Use EC2** for high traffic (> 10 million requests/month)
- **Hybrid approach:** Use Lambda for variable traffic spikes, EC2 for baseline

## Total Estimated Monthly Cost (Low Usage):
- EC2: $4.38
- Lambda (10,000 requests): $0.004
- DynamoDB: $0.50
- **Total: ~$4.88/month**
