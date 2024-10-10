Here is the translated README.md:

# Informational Modeling Project - CFB Pharmacy

## Overview
This project consists of modeling a database using the **Star Schema**, applied to the context of CFB Pharmacy, which seeks to develop decision support systems for revenue analysis. The project was carried out in two stages: the first (A1) involved the creation of the relational and conceptual model, while the second (A2) focused on the implementation of the dimensional model and the Data Warehouse (DW).

## Project Objectives
- **Dimensional Modeling**: Develop the dimensional model for revenue analysis, considering detailed and aggregated facts.
- **Data Warehouse (DW) Creation**: Implement the DW in the database, using the best practices of dimensional modeling.
- **ETL (Extract, Transform, Load)**: Develop SQL scripts for the initial load and DW updates.
- **Data Analysis**: Create an Excel spreadsheet connected to the DW to allow typical BI analyses, such as Slice and Dice, Pivot, Drill Down, and Drill Up.

## Created Models
- **Conceptual Model (ER Diagram)**:
  ![Conceptual Model](arquivos_grupo_cfb/Modelo%20Conceitual%20(ER%20Diagram).png)

- **Relational Model**:
  ![Relational Model](arquivos_grupo_cfb/Modelo%20Relacional.png)
  
- **Complete Vertabelo Model**:
  ![Complete Vertabelo Model](modelos_datawarehouse/CFB_Datawarehouse_completo-2021-11-23_22-49.png)


## Description of Facts and Dimensions
- **Detailed Fact**: Contains detailed revenue information, including the amount (R$), quantity of medicines sold, order ID, and time of sale. Breakdowns are possible by:
  - Customer
  - Medicine
  - Supplier
  - Category
  - Customer address
  - Date (complete, day of the week, day, month, quarter, year)

- **Aggregated Fact**: Contains aggregated revenues, allowing the same breakdowns as the detailed fact.

## Implementation
- **DW Creation**: The DW was created in the database `DW<minimundo>` on the laboratory server.
- **SQL Scripts**: SQL scripts were developed for the initial load and periodic updates of the DW.
- **Excel for Analysis**: An Excel spreadsheet was created to allow direct connection to the DW and perform analyses using BI operations.

## How to Execute
1. Clone this repository:
   ```bash
   git clone https://github.com/Gabriel-Machado-GM/Modelagem-Informacional.git
   ```
2. Connect to the `DW<minimundo>` database using the provided credentials.
3. Run the SQL scripts in the indicated order to perform the initial load and updates.
4. Open the Excel spreadsheet and configure the connection to the DW to perform the desired analyses.

## Conclusions
This project demonstrated the applicability of the Star Schema in creating decision support systems, specifically for revenue analysis in a pharmacy. The implementation of the Data Warehouse and the creation of the ETL scripts proved effective in managing and exploring large volumes of data, providing valuable insights for the management of CFB Pharmacy.

## Authors
- **Gabriel Machado**
- **Gianlucca Devigili**

## License
This project is licensed under the [MIT License](LICENSE).
