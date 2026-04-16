# 🧠 SQL Interview Problem: Employee Hierarchy Mapping (Manager & Senior Manager)

## 📌 Problem Statement

You are given an `emp` table that represents an organization's structure. Each employee may report to a manager, and that manager may further report to another manager, forming a hierarchy.

Your task is to **analyze the reporting structure** and, for every employee, determine:

- Their **direct manager**
- Their **senior manager** (manager’s manager)

---

## 🎯 Objective

For each employee in the organization, generate a result that includes:

- Employee ID  
- Employee Name  
- Direct Manager Name  
- Senior Manager Name  

---

## 🧩 Key Concepts Tested

This problem evaluates your understanding of:

- **Self Joins** (joining a table with itself)
- **Hierarchical Data Handling**
- **LEFT JOIN behavior**
- Handling **NULL values**
- Identifying **multi-level relationships**

---

## 🏢 Understanding the Hierarchy

The table represents a structure like this:
