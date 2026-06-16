-- ============================================================
-- Project Portfolio Performance Dashboard
-- SQL Analysis Queries
-- Author: Vigneshwari
-- Dataset: project_portfolio_clean.csv
-- Tool: DB Browser for SQLite
-- Description: Business questions answered using SQL to support
--              a 4-page Power BI dashboard for PMO analysis
-- ============================================================


-- ============================================================
-- PAGE 1: EXECUTIVE OVERVIEW
-- ============================================================

-- Q1: Total Projects by Status
-- Business Question: What is the current state of our project portfolio?
SELECT 
    Project_Status,
    COUNT(*) AS Total_Projects
FROM project_portfolio_clean
GROUP BY Project_Status
ORDER BY Total_Projects DESC;
-- Result: Completed 268 | In Progress 257 | Delayed 247 | Not Started 228


-- Q2: Overall Budget Performance
-- Business Question: Is the portfolio over or under budget overall?
SELECT 
    SUM(Planned_Budget)                                    AS Total_Planned_Budget,
    SUM(Actual_Spend)                                      AS Total_Actual_Spend,
    SUM(Budget_Variance)                                   AS Total_Variance,
    ROUND(SUM(Budget_Variance)*100.0/SUM(Planned_Budget),2) AS Overall_Variance_Pct
FROM project_portfolio_clean;
-- Result: Portfolio is running 4.75% over budget


-- Q3: Average Milestone Completion Rate
-- Business Question: How far along is the portfolio in delivering milestones?
SELECT 
    ROUND(AVG(Milestone_Completion_Pct),2) AS Avg_Milestone_Completion
FROM project_portfolio_clean;
-- Result: 49.54% — portfolio is halfway through planned milestones


-- Q4: Projects At Risk
-- Business Question: How many projects are at risk of failing?
-- Definition: Delayed or In Progress with less than 50% milestones completed
SELECT 
    COUNT(*) AS Projects_At_Risk
FROM project_portfolio_clean
WHERE Project_Status IN ('Delayed', 'In Progress')
AND Milestone_Completion_Pct < 50;
-- Result: 222 projects (22% of portfolio) are at risk


-- ============================================================
-- PAGE 2: BUDGET ANALYSIS
-- ============================================================

-- Q5: Budget Variance by Department
-- Business Question: Which department has the worst budget performance?
SELECT 
    Department,
    SUM(Planned_Budget)                                    AS Total_Planned,
    SUM(Actual_Spend)                                      AS Total_Spent,
    SUM(Budget_Variance)                                   AS Total_Variance,
    ROUND(SUM(Budget_Variance)*100.0/SUM(Planned_Budget),2) AS Variance_Pct
FROM project_portfolio_clean
GROUP BY Department
ORDER BY Variance_Pct DESC;
-- Result: HR worst at 8.1% | IT best at 2.83%


-- Q6: Over Budget Projects by Priority
-- Business Question: Are high priority projects being protected from budget overruns?
SELECT 
    Priority,
    COUNT(*) AS Overbudget_Projects
FROM project_portfolio_clean
WHERE Budget_Variance > 0
GROUP BY Priority
ORDER BY Overbudget_Projects DESC;
-- Result: Budget overruns are evenly spread across all priority levels
-- Insight: No priority level is being better managed — systemic issue


-- ============================================================
-- PAGE 3: REGIONAL & STATUS ANALYSIS
-- ============================================================

-- Q7: Delayed Projects by Region
-- Business Question: Which regions have the most project delays?
SELECT 
    Region,
    COUNT(*) AS Delayed_Projects
FROM project_portfolio_clean
WHERE Project_Status = 'Delayed'
GROUP BY Region
ORDER BY Delayed_Projects DESC;
-- Result: Jos worst (35) | Enugu and Benin City best (14 each)


-- ============================================================
-- PAGE 4: MILESTONE & MANAGER PERFORMANCE
-- ============================================================

-- Q8: Milestone Completion by Department
-- Business Question: Which department is delivering milestones most effectively?
SELECT 
    Department,
    SUM(Milestone_Total)                                        AS Total_Milestones,
    SUM(Milestone_Completed)                                    AS Completed_Milestones,
    ROUND(SUM(Milestone_Completed)*100.0/SUM(Milestone_Total),2) AS Completion_Rate
FROM project_portfolio_clean
GROUP BY Department
ORDER BY Completion_Rate DESC;
-- Result: Marketing leads at 51.54% | Operations worst at 46.54%
-- Insight: Operations is double risk — over budget AND behind on milestones


-- Q9: Project Manager Performance
-- Business Question: Which project managers are delivering best results?
SELECT 
    Project_Manager,
    COUNT(*)                              AS Total_Projects,
    ROUND(AVG(Milestone_Completion_Pct),2) AS Avg_Completion_Pct,
    ROUND(AVG(Budget_Variance_Pct),2)      AS Avg_Budget_Variance_Pct
FROM project_portfolio_clean
WHERE Project_Manager IS NOT NULL
AND Project_Manager != ''
GROUP BY Project_Manager
ORDER BY Avg_Completion_Pct DESC;
-- Result: Nancy Oluomachi top performer (54% completion, 4.3% variance)
-- Result: Patric NwaezeUbong needs support (45.31% completion)
-- Note: 203 projects have no assigned manager — flagged as data quality issue
