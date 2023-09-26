//
//  ContentView.swift
//  Calculadora_Erick
//
//  Created by Student03 on 01/09/23.
//

import SwiftUI

struct ContentView: View {
    @State private var peso: String = ""
    @State private var altura: String = ""
    @State private var imc: String = "IMC"
    @State private var pesoD: Double = 0
    @State private var altD: Double = 0
    @State private var calculo: Double = 0
    @State private var cor: String = "White"
    @State private var calcular = false
    @State private var textcolor = Color.black
    
    var body: some View {
        
        VStack {
            VStack {
                Text("Calculadora de IMC")
                    .font(.title)
                    .foregroundColor(Color.black)
                
                TextField("Digite seu peso", text:$peso)
                    .keyboardType(.decimalPad)
                    .multilineTextAlignment(.center)
                    .padding(10)
                
                TextField("Digite sua altura", text:$altura)
                    .keyboardType(.decimalPad)
                    .multilineTextAlignment(.center)
                    .padding(10)
                    .foregroundColor(textcolor)
                
                
                Spacer()
                Button("Calcular") {
                    pesoD = Double(peso) ?? 0
                    altD = Double(altura) ?? 0
                    calculo = pesoD / (altD * altD)
                    
                    
                    if calculo < 18.5 {
                        imc = "Baixo Peso"
                        cor = "baixo-peso"
                    }
                    if calculo >= 18.5 && calculo <= 24.99{
                        imc = "Normal"
                        cor = "normal"
                    }
                    if calculo >= 25 && calculo <= 29.99{
                        imc = "Sobrepeso"
                        cor = "sobrepeso"
                    }
                    if calculo > 30.0{
                        imc = "Obesidade"
                        cor = "obesidade"
                    }
                    
                    
                    
                    
                }
                    .buttonStyle(.bordered)
                    .foregroundColor(Color.black)
                    
                
        }
            
           
            Text(imc)
                .padding(100)
            Spacer()
            
        Image("tabela-IMC")
                .resizable()
                .scaledToFit()
               
            
            
        }
        .background(Color(cor))
        .background(Color.cyan)
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
