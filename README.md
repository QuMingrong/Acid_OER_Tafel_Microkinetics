# Acid_OER_Tafel_Microkinetics

This repository contains MATLAB scripts used to derive the Tafel behavior and surface intermediate coverage during the oxygen evolution reaction (OER) under acidic conditions. The calculations are based on microkinetic analysis assuming different rate-determining steps (RDS).

## 🔬 Project Description

These codes were developed to support the analysis of Tafel slopes and mechanistic transitions in acidic OER systems, particularly focusing on the role of RDS changes and their effect on observed electrochemical kinetics. The results are used to rationalize why Tafel slopes may remain unchanged even when the underlying reaction mechanism changes.

## 📁 File Descriptions

- `Tafel_Acid_OER_RDS_step2.m`:  
  Derives Tafel behavior assuming the RDS is **M–OH → M–O + (H⁺ + e⁻)** (Step 2 in the AEM pathway).

- `Tafel_Acid_OER_RDS_step3.m`:  
  Derives Tafel behavior assuming the RDS is **M–O + H₂O → M–OOH + (H⁺ + e⁻)** (Step 3 in the AEM pathway).

Both scripts calculate the surface coverage of key intermediates (θ_M*, θ_M–OH*, θ_M–O*) and the resulting Tafel curve, and produce plots suitable for publication.

## ⚙️ Requirements

- MATLAB R2020a or later  
- No additional toolboxes required

## 📊 Output

Each script generates a figure showing:
- Tafel curve (log(j) vs η)
- Coverage of intermediates as functions of overpotential

## 📎 Citation

If you use or refer to this code, please cite the GitHub repository as follows:

> Qu, M. (2025). *Acid_OER_Tafel_Microkinetics* [GitHub repository].  
> https://github.com/QuMingrong/Acid_OER_Tafel_Microkinetics

Alternatively, you may include the link directly in figure captions or methods sections, e.g.:

> "The MATLAB code used for Tafel slope derivation is available at https://github.com/QuMingrong/Acid_OER_Tafel_Microkinetics."

## 📬 Contact

For questions or collaborations, please contact: qmr@mail.ustc.edu.cn
