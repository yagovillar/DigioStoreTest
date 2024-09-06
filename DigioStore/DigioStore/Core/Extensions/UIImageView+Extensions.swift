//
//  UIImageView+Extensions.swift
//  DigioStore
//
//  Created by Yago Vanzan on 04/09/24.
//

import Foundation
import UIKit

private var imageCache = NSCache<NSString, UIImage>()

extension UIImageView {
    
    func loadImage(from urlString: String, placeholder: UIImage? = UIImage(named: "AppLogo")) {
        // Definir imagem de placeholder
        self.image = placeholder
        
        // Verificar se a imagem está em cache
        if let cachedImage = imageCache.object(forKey: urlString as NSString) {
            self.image = cachedImage
            return
        }
        
        // Converter string para URL
        guard let imgUrl = URL(string: urlString) else {
            print("URL inválida: \(urlString)")
            return
        }
        
        // Criar URLSession data task para buscar os dados da imagem
        URLSession.shared.dataTask(with: imgUrl) { [weak self] data, response, error in
            // Lidar com erro
            if let error = error {
                print("Erro ao buscar imagem: \(error)")
                return
            }
            
            // Verificar resposta HTTP
            guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
                print("Resposta HTTP inválida")
                return
            }
            
            // Garantir que os dados não sejam nulos e criar UIImage a partir dos dados
            guard let data = data, let image = UIImage(data: data) else {
                print("Falha ao converter dados em imagem")
                return
            }
            
            // Adicionar a imagem ao cache
            imageCache.setObject(image, forKey: urlString as NSString)
            
            // Atualizar a imagem na fila principal
            DispatchQueue.main.async {
                self?.image = image
            }
        }.resume() // Iniciar a tarefa de dados
    }
}
