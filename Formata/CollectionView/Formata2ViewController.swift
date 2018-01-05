//
//  Formata2ViewController.swift
//  acelerogyrocospe
//
//  Created by Fabio Sousa da Silva on 03/01/2018.
//  Copyright © 2018 Fabio Sousa da Silva. All rights reserved.
//

import UIKit

class Formata2ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UISearchBarDelegate {
    
    var arrayTeste: Array<ItensTable> = Teste().retornaTestes()
    var arrayVazio: Array<ItensTable> = []
    let arrayPacote: Array<PacoteViagem> = PacoteViagemDAO().retornaTodasAsViagens()
    var arrayMudaPacote: Array<PacoteViagem> = []
    
    
    @IBOutlet weak var searchTeste: UISearchBar!
    @IBOutlet weak var collectionTesteView: UICollectionView!
    @IBOutlet weak var labelCount: UILabel!
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrayPacote.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CollectionViewCell
        let testando = arrayPacote[indexPath.row]
        cell.teste1Lbl?.text = testando.viagem.titulo
        cell.teste2Lbl?.text = testando.viagem.preco
        cell.teste3Lbl?.text = String(testando.viagem.quantidadeDeDias)
        cell.imageCell?.image = UIImage(named: testando.viagem.caminhoDaImagem)
        
        cell.layer.cornerRadius = 8
        cell.layer.borderWidth = 1
        cell.layer.borderColor = UIColor.lightGray.cgColor
        
        return cell
    }
    

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (collectionTesteView.bounds.width / 2) - 10.0, height: 160)
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {

//        let searchTeste = NSPredicate(format: "titulo contains[c] %@", searchText)
//        let searchFinal:Array<PacoteViagem> = (arrayPacote as NSArray).filtered(using: searchTeste) as! Array
//        arrayMudaPacote = searchFinal
//        collectionTesteView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        arrayVazio = arrayTeste
        collectionTesteView.dataSource = self
        collectionTesteView.delegate = self
        searchTeste.delegate = self
        
        self.labelCount?.text = retornaLabel()
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func retornaLabel() -> String {
        
        return arrayPacote.count == 0 ? "Nada" : "\(arrayTeste.count) Testes"
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let pacote = arrayPacote[indexPath.item]
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "detalhesID") as! DetalhesViewController
        vc.pacoteSelecionado = pacote
        self.present(vc, animated: true, completion: nil)

    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
