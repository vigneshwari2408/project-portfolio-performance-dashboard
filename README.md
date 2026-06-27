# Project Portfolio Performance Dashboard

## Overview
This project simulates a real-world PMO (Project Management Office) dashboard built to help management monitor project performance across budget, milestones, and regional delivery. It demonstrates skills in data preparation, SQL analysis, and Power BI visualization.

> 🎓 **Portfolio Project** — This is an independent analytical project 
> built to demonstrate Business Intelligence and PMO analysis skills. 
> It uses a public Kaggle dataset and does not represent work 
> performed for any employer.

---

## Business Problem
Organizations managing large project portfolios struggle to answer critical questions:
- Are projects on time and on budget?
- Which departments are underperforming?
- Where are resources being inefficiently allocated?
- Which project managers need support?

This dashboard answers all of these questions in one place.

---

## Tools Used
| Tool | Purpose |
|---|---|
| Microsoft Excel + Power Query | Data cleaning and enrichment |
| DB Browser for SQLite | SQL analysis and query validation |
| Power BI Desktop | Dashboard development |
| GitHub | Version control and portfolio hosting |

---

## Dataset

- **Source:** [https://www.kaggle.com/datasets/derrickkuria/project-management)
- **Base rows:** 1,000 projects
- **Original columns:** Project ID, Company, Site Name, Entry Date, Work Status, Complete Date, Recurring Revenue, NRR, Task Owner, Currency

**Data Enrichment & Methodology**
The source dataset provided project identity, dates, and status information. To build a realistic PMO analysis, the following fields were **synthetically generated** using Power Query, derived from existing fields to maintain internal consistency:

| Field | How it was generated |
|---|---|
| `Department` | Assigned via formula across 5 departments |
| `Priority` | Assigned via formula across 4 priority levels |
| `Planned_End_Date` | Calculated from Start_Date + randomized duration |
| `Actual_Spend` | Derived from Planned_Budget ± randomized variance |
| `Budget_Variance` / `Budget_Variance_Pct` | Calculated from Planned_Budget vs Actual_Spend |
| `Milestone_Total` / `Milestone_Completed` | Assigned via formula to simulate milestone tracking |
| `Milestone_Completion_Pct` | Calculated from milestone fields above |

This approach was chosen because the original dataset did not contain budget, milestone, or department-level detail needed for PMO analysis. All names, departments, and performance figures are synthetic and used for demonstration purposes only — they do not reflect real individuals or companies.

**Note:** `Delay_Days` calculation was impacted by inconsistent date formats in the source data and was excluded from final analysis. Timeline analysis is based on `Project_Status` instead.

---

## Dashboard Pages

### Page 1 — Executive Overview
High-level portfolio summary for senior management.
- Total Projects: 1,000
- Average Milestone Completion: 49.54%
- Total Budget Variance: 11.59M over budget
- Projects At Risk: 222 (22% of portfolio)

![Executive Overview](screenshots/executive_overview.png)

### Page 2 — Budget Analysis
Deep dive into budget performance by department, priority, and project manager.
- HR department most over budget at 8.1% variance
- IT department most efficient at 2.83% variance
- Critical priority projects have highest budget overruns
- Highest average budget variance observed among certain managers

![Budget Analysis](screenshots/budget_analysis.png)

### Page 3 — Regional & Status Analysis
Project status distribution across regions and departments.
- Jos region has most delayed projects (35)
- Enugu and Benin City performing best
- Budget overruns are systemic across all departments

![Regional & Status Analysis](screenshots/regional_status_analysis.png)

### Page 4 — Milestone & Manager Performance
Milestone delivery tracking and project manager comparison.
- Top performer shows 54% completion with 4.3% budget variance
- Lowest performer shows 45.31% completion
- 203 projects have no assigned manager — resource gap identified

![Milestone & Manager Performance](screenshots/milestone_manager_performance.png)

---

## Key Business Insights
1. **Portfolio is 4.75% over budget overall** — immediate cost control needed
2. **22% of projects are at risk** — delayed or in progress with under 50% milestones done
3. **HR department needs intervention** — highest budget variance at 8.1%
4. **Operations is double risk** — over budget AND lowest milestone completion
5. **203 projects unassigned** — critical resource management gap

---

## SQL Analysis
Business questions answered using SQL in DB Browser for SQLite.
Full queries available in [`sql/sql_queries.sql`](sql/sql_queries.sql)

Key analyses:
- Portfolio budget variance by department
- Projects at risk identification
- Regional delay analysis
- Project manager performance comparison
- Milestone completion rates

---

## Project Structure

| File | Description |
|---|---|
| `data/project_portfolio_clean.csv` | Cleaned dataset (1000 rows, 19 columns) |
| `sql/sql_queries.sql` | SQL business analysis queries |
| `dashboard/project_portfolio_dashboard.pbix` | Power BI dashboard file |
| `screenshots/executive_overview.png` | Page 1 screenshot |
| `screenshots/budget_analysis.png` | Page 2 screenshot |
| `screenshots/regional_status_analysis.png` | Page 3 screenshot |
| `screenshots/milestone_manager_performance.png` | Page 4 screenshot |
| `README.md` | Project documentation |

---

## 👤 Author

**Vigneshwari Nalla**

📍 Based in France | Open to internships and junior analyst roles

🔗 [LinkedIn](https://www.linkedin.com/in/vigna24/) | 📧 vigna2408@gmail.com | [GitHub Profile](https://github.com/vigneshwari2408)

Aspiring Operations Analyst | Business Analyst | Project Coordinator
