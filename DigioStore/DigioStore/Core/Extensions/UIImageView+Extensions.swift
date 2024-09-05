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
        self.image = placeholder

        // Verificar se a imagem já está em cache
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

            // Verificar o código de status HTTP
            guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
                print("Resposta HTTP inválida")
                return
            }

            // Garantir que os dados não sejam nulos e criar UIImage a partir dos dados
            if let data = data, let image = UIImage(data: data) {
                // Adicionar a imagem ao cache
                imageCache.setObject(image, forKey: urlString as NSString)

                // Atualizar UIImageView na thread principal
                DispatchQueue.main.async {
                    self?.image = image
                }
            } else {
                print("Falha ao converter dados em imagem")
            }
        }.resume() // Iniciar a tarefa de dados
    }
}
