//
//  ViewController.swift
//  TpCalc
//
//  Created by mbds on 08/04/2021.
//

import UIKit

class ViewController: UIViewController {
        
    @IBOutlet weak var lblEcran: UILabel!
    
    var valeur: String? = ""
    var operateur: String = ""
    var resultat: Double? = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
        @IBAction func initialiserBtn(_ type: UIButton) {
            
            resultat = valeur == nil ? 0 : resultat
            valeur = (valeur ?? "") + (type.titleLabel?.text ?? "")
           lblEcran.text = valeur
            
        }

    
    @IBAction func onClickOperation(_ type: UIButton) {
        
        if (type.titleLabel?.text ?? "0" ) == "="{
            Calcul()
            if (resultat == nil ){
                lblEcran.text = "Erreur"
            } else{
                lblEcran.text = String(resultat ?? 0)
            }
            valeur = nil
            operateur = ""
        } else {
            lblEcran.text = type.titleLabel?.text ?? ""
            Calcul()
            operateur = type.titleLabel?.text ?? ""
            }
    
    }
    
    
    func Calcul() {
        var valeurNeutre: Double
        switch operateur {
        case "/":
            let deno = (Double(valeur ?? "1" ) ?? 0)
            if (deno == 0){
                resultat = nil
            } else{
                valeurNeutre = resultat == 0 ? 1 : (resultat ?? 0)
                resultat = valeurNeutre / deno
            }
            
        case "*":
            valeurNeutre = resultat == 0 ? 1 : (resultat ?? 0)
            resultat = valeurNeutre * (Double(valeur ?? "1") ?? 0)
        case "-":
            resultat = (resultat ?? 0) - (Double(valeur ?? "0") ?? 0)
        case "+":
            resultat = (resultat ?? 0) + (Double(valeur ?? "0") ?? 0)
        default:
            resultat = (resultat ?? 0) + (Double(valeur ?? "0") ?? 0)
        }
      
        
        
        valeur = ""
        
        
    }
    
    
    @IBAction func OnClickClear(_ sender: UIButton) {
        lblEcran.text = "0"
        valeur = ""
        operateur = ""
        resultat = 0
    }
    
}

