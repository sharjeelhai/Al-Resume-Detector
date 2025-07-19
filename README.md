

# 📄 AI Resume Detector for Recruiters

**AI Resume Detector** is a smart resume screening and analysis system built for modern recruitment platforms. It leverages AI to assist **recruiters** in evaluating resumes based on skill match, experience relevance, red flag detection, and overall fit for job postings. The platform also provides an **admin dashboard** to manage AI configuration, system feedback, and privacy-related logs.



## 🎯 Key Objectives

* Automate resume evaluation and shortlisting
* Score resumes based on job relevance
* Detect red flags like job gaps, missing contact info, or job-hopping
* Streamline job posting and resume review process
* Provide full admin control and transparency (e.g., feedback handling, AI configuration)
* Ensure GDPR compliance via consent logging


## 👥 User Roles

* **Recruiter (User Panel)** – Posts jobs, uploads resumes, views AI analysis, shortlists candidates
* **Admin (Admin Panel)** – Manages AI settings, handles feedback reports, monitors platform activity



## 🧩 Main Features

### 🧑‍💼 Recruiter Panel

* 🔐 Recruiter Authentication & Login
* 📄 Job Posting Management
* 📤 Resume Upload & Parsing
* 🤖 AI Resume Analysis with Scoring and Skill Match
* ✅ Shortlist or Reject Candidates Based on AI Output
* 📊 View Activity Logs and Resume Performance Stats
* 🔔 Notifications for Resume Submissions and System Updates

### 🛡️ Admin Panel

* ⚙️ Configure AI Engine (weights, model version)
* 📬 View and Manage Feedback or Abuse Reports
* 🔍 Track User Activities via Logs
* ✅ Monitor GDPR-Related Consent Logs (data deletion, policy acceptance)
* 🤖 Review Chatbot Interactions (if integrated)



## 🗂️ Database Schema Overview

### ✅ Shared Tables

* **`users`** – Stores both recruiters and admins with role-based access
* **`activity_logs`** – Tracks actions like logins, uploads, shortlists
* **`notifications`** – Manages user notifications



### 🧑‍💼 Recruiter-Side Tables

| Table                    | Purpose                                          |
| ------------------------ | ------------------------------------------------ |
| `job_posts`              | Stores job listings posted by recruiters         |
| `resumes`                | Stores uploaded resume data and metadata         |
| `resume_analysis`        | AI-generated analysis, score, match %, red flags |
| `shortlisted_candidates` | Tracks shortlisted resumes with export info      |

---

### 🛡️ Admin-Side Tables

| Table              | Purpose                                              |
| ------------------ | ---------------------------------------------------- |
| `ai_model_config`  | Manages AI config settings and model version         |
| `feedback_reports` | Stores bug reports, abuse complaints, or suggestions |
| `consent_logs`     | Logs user consent for GDPR compliance                |



### 🔧 Optional / Enhancer Tables

| Table                  | Purpose                                                |
| ---------------------- | ------------------------------------------------------ |
| `chatbot_interactions` | Logs user queries & AI responses if chatbot is enabled |
| `resume_flags`         | Stores red flag reasons detected in resumes            |



## 🧭 Entity Relationships

| Relationship                         | Type        |
| ------------------------------------ | ----------- |
| `user` ↔ `job_posts`                 | One-to-Many |
| `job_posts` ↔ `resumes`              | One-to-Many |
| `resumes` ↔ `resume_analysis`        | One-to-One  |
| `resumes` ↔ `shortlisted_candidates` | One-to-One  |
| `user` ↔ `activity_logs`             | One-to-Many |
| `user` ↔ `feedback_reports`          | One-to-Many |
| `admin` ↔ `ai_model_config`          | One-to-Many |



## 📌 Tech Stack

* **Backend:** SQL Server (SSMS)
* **Database Design:** Normalized relational schema with foreign keys
* **AI Layer (Future):** Integration with NLP-based resume parsers and scoring models (e.g., GPT-based API or custom ML)
* **Optional Add-ons:** Chatbot, GDPR tools, export tools (CSV, PDF)



## 📥 Getting Started

1. Import the provided `.sql` file into your SQL Server Management Studio (SSMS)
2. Ensure correct roles are assigned to users (`recruiter` or `admin`)
3. Use this schema as a backend for a web app, mobile app, or admin panel
4. Integrate AI logic for analyzing resume content



## 📌 Note

* JSON columns require SQL Server 2016+ or appropriate support
* Recommended to use indexing on key fields like `user_id`, `job_id`, and `resume_id`
* Foreign keys are enforced with `ON DELETE CASCADE` for referential integrity

