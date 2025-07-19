
-- Use the correct database
USE AIResumeDetector;
GO

--USERS table
CREATE TABLE users (
    user_id INT PRIMARY KEY IDENTITY(1,1),
    name NVARCHAR(100),
    email NVARCHAR(100) UNIQUE,
    password_hash NVARCHAR(255),
    role NVARCHAR(20) DEFAULT 'recruiter',
    status NVARCHAR(20) DEFAULT 'active',
    created_at DATETIME DEFAULT GETDATE(),
    last_login DATETIME
);
GO

-- JOB_POSTS table
CREATE TABLE job_posts (
    job_id INT PRIMARY KEY IDENTITY(1,1),
    user_id INT,
    title NVARCHAR(150),
    description NVARCHAR(MAX),
    skills_required NVARCHAR(MAX),
    experience_required NVARCHAR(50),
    status NVARCHAR(20) DEFAULT 'open',
    created_at DATETIME DEFAULT GETDATE(),
    FOREIGN KEY (user_id) REFERENCES users(user_id)
);
GO

-- RESUMES table
CREATE TABLE resumes (
    resume_id INT PRIMARY KEY IDENTITY(1,1),
    job_id INT,
    user_id INT,
    file_path NVARCHAR(255),
    name NVARCHAR(100),
    contact_info NVARCHAR(255),
    skills NVARCHAR(MAX),
    experience_years INT,
    uploaded_at DATETIME DEFAULT GETDATE(),
    FOREIGN KEY (job_id) REFERENCES job_posts(job_id),
    FOREIGN KEY (user_id) REFERENCES users(user_id)
);
GO

-- RESUME_ANALYSIS table
CREATE TABLE resume_analysis (
    analysis_id INT PRIMARY KEY IDENTITY(1,1),
    resume_id INT,
    ai_score DECIMAL(5,2),
    matched_skills NVARCHAR(MAX),
    match_percent DECIMAL(5,2),
    red_flags NVARCHAR(MAX),
    status NVARCHAR(20) DEFAULT 'pending',
    notes NVARCHAR(MAX),
    FOREIGN KEY (resume_id) REFERENCES resumes(resume_id)
);
GO

-- SHORTLISTED_CANDIDATES table
CREATE TABLE shortlisted_candidates (
    shortlist_id INT PRIMARY KEY IDENTITY(1,1),
    resume_id INT,
    user_id INT,
    exported BIT DEFAULT 0,
    export_format NVARCHAR(10) DEFAULT 'pdf',
    shortlisted_at DATETIME DEFAULT GETDATE(),
    FOREIGN KEY (resume_id) REFERENCES resumes(resume_id),
    FOREIGN KEY (user_id) REFERENCES users(user_id)
);
GO

-- ACTIVITY_LOGS table
CREATE TABLE activity_logs (
    log_id INT PRIMARY KEY IDENTITY(1,1),
    user_id INT,
    action NVARCHAR(255),
    details NVARCHAR(MAX),
    timestamp DATETIME DEFAULT GETDATE(),
    FOREIGN KEY (user_id) REFERENCES users(user_id)
);
GO

-- NOTIFICATIONS table
CREATE TABLE notifications (
    notification_id INT PRIMARY KEY IDENTITY(1,1),
    user_id INT,
    message NVARCHAR(MAX),
    is_read BIT DEFAULT 0,
    created_at DATETIME DEFAULT GETDATE(),
    FOREIGN KEY (user_id) REFERENCES users(user_id)
);
GO

-- AI_MODEL_CONFIG table
CREATE TABLE ai_model_config (
    config_id INT PRIMARY KEY IDENTITY(1,1),
    keyword_weights NVARCHAR(MAX),
    version NVARCHAR(20),
    updated_by INT,
    updated_at DATETIME DEFAULT GETDATE(),
    FOREIGN KEY (updated_by) REFERENCES users(user_id)
);
GO

-- FEEDBACK_REPORTS table
CREATE TABLE feedback_reports (
    report_id INT PRIMARY KEY IDENTITY(1,1),
    user_id INT,
    report_type NVARCHAR(20),
    message NVARCHAR(MAX),
    status NVARCHAR(20) DEFAULT 'pending',
    submitted_at DATETIME DEFAULT GETDATE(),
    FOREIGN KEY (user_id) REFERENCES users(user_id)
);
GO

-- CONSENT_LOGS table
CREATE TABLE consent_logs (
    consent_id INT PRIMARY KEY IDENTITY(1,1),
    user_id INT,
    action NVARCHAR(30),
    timestamp DATETIME DEFAULT GETDATE(),
    FOREIGN KEY (user_id) REFERENCES users(user_id)
);
GO

-- CHATBOT_INTERACTIONS table
CREATE TABLE chatbot_interactions (
    interaction_id INT PRIMARY KEY IDENTITY(1,1),
    user_id INT,
    query NVARCHAR(MAX),
    response NVARCHAR(MAX),
    created_at DATETIME DEFAULT GETDATE(),
    FOREIGN KEY (user_id) REFERENCES users(user_id)
);
GO

-- RESUME_FLAGS table
CREATE TABLE resume_flags (
    flag_id INT PRIMARY KEY IDENTITY(1,1),
    resume_id INT,
    issue NVARCHAR(50),
    detected_at DATETIME DEFAULT GETDATE(),
    FOREIGN KEY (resume_id) REFERENCES resumes(resume_id)
);
GO
