# Cloud-Native Playwright Automation on Kubernetes (K3s)

![Kubernetes](img.shields.io)
![AWS](img.shields.io)
![Docker](img.shields.io)
![Playwright](img.shields.io)

## 📋 Project Overview
This project demonstrates a professional-grade test automation pipeline designed for cloud scalability. It showcases the full lifecycle of a modern test suite: from local development to cloud-native orchestration. 

I engineered a custom, lightweight containerization environment to host Playwright tests, pushed the images to **Amazon ECR**, and executed them as **Kubernetes Jobs** within a **K3s cluster** hosted on **AWS EC2**.

---

## 🛠️ Technical Stack
*   **Automation:** Playwright (Node.js)
*   **Containerization:** Docker (Custom Alpine-based image)
*   **Cloud Provider:** Amazon Web Services (AWS) (EC2, ECR Public, IAM)
*   **Orchestration:** K3s (Lightweight Kubernetes)
*   **OS:** Ubuntu 24.04 LTS

---

## 🏗️ Project Architecture
`Local Code` ➔ `Docker Build (Alpine)` ➔ `AWS ECR Public` ➔ `K3s Cluster (EC2)` ➔ `Kubernetes Job Execution`

---

## 🚀 Key Technical Challenges & Solutions

### 1. Resource Optimization for Free Tier
**Challenge:** Running a full Kubernetes cluster and headless browsers on an AWS `t3.micro` (1GB RAM) caused system freezes.  
**Solution:** 
*   Implemented a **2GB Swap File** to provide virtual memory overhead.
*   Built a custom **Alpine Linux** Docker image to reduce memory footprint.

### 2. Registry Authentication
**Challenge:** Persistent "Access Denied" errors when pushing to Private ECR due to local credential helper conflicts.  
**Solution:** Pivoted to **Amazon ECR Public**, allowing for seamless integration with Kubernetes without requiring complex `ImagePullSecrets`.

### 3. Headless Browser Orchestration
**Challenge:** Standard Playwright binaries are not natively compatible with Alpine Linux.  
**Solution:** Configured the Playwright runner to utilize system-level **Chromium** with specific flags (`--no-sandbox`) to ensure successful execution.

---

## 📊 Evidence of Success
**Execution Log Output:**
```text
Successfully found page title: Google
  1 passed (1.2s)
NAME               READY   STATUS      RESTARTS   AGE
smoke-test-vhv92   0/1     Completed   0          2m
