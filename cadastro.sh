#!/bin/bash
#Data de Criação: 08/02/2018

clear

NOME(){
	read -p "Digite seu Nome: " nome  	
	echo $nome | grep -E '[0-9.-\=_,><?:;!@#$%"&*()_+"\]'
	if [ $? == 1 ]; then
		clear
		echo "Nome Válido!"
		echo "Nome: $nome" >> /projeto/dados/$nome.txt
     		sleep 2
		clear
		EMAIL
	else
		echo "Nome Inválido!"
		echo "Digite novamente: "
		sleep 2
		clear
		NOME	
	fi

}

EMAIL(){
	clear
	read -p "Digite um E-mail: " email
	echo $email | grep -E '^([a-zA-Z0-9_-.])+@[0-9a-zA-Z.-]+\.[a-z]{2,3}$'
	if [ $? == 0 ]; then
		clear
		echo "E-mail Válido!"
		echo "E-mail: $email" >> /projeto/dados/$nome.txt
		sleep 2
		clear
		TELEFONE
	else
		echo "Esse E-mail não é válido!"
		echo "Digite novamente: "
	       	sleep 2
		clear	
		EMAIL
	fi	
		
}

TELEFONE(){
        echo "Opções:"
        echo "1) Número de telefone Fixo:"
        echo "2) Número de telefone celular:"
        read opcao
        if [ $opcao == 1 ]; then
                clear
                FIXO
        else
                clear
                CELL
        fi
}

FIXO(){
        echo "Formato do número de telefone: (DDD) xxxx-xxxx"
        read -p "Informe seu número de telefone: " telefone
        echo $telefone | grep -E '^[(][0-9]{2}[)][ ][0-9]{4}[-][0-9]{4}$'
        if [ $? == 0 ]; then
                clear
                echo "Número de telefone válido!"
                echo "Telefone fixo: $telefone " >> /projeto/dados/$nome.txt
                sleep 1
                clear
                RG
        else
                echo "Número de telefone inválido!"
                sleep 2
                clear
                echo "Digite novamente: "
                FIXO
        fi
}

CELL(){
        echo "Formato do número do celular: (DDD) 9xxxx-xxxx"
        read -p "Informe o número do seu celular: " cell
        echo $cell | grep -E '^[(][0-9]{2}[)][ ][9][0-9]{4}[-][0-9]{4}$'
        if [ $? == 0 ]; then
                clear
                echo "Número de celular válido!"
                echo "Telefone celular: $cell " >> /projeto/dados/$nome.txt
                sleep 1
                clear
                RG
        else
                echo "Número de celular inválido!"
                sleep 2
                clear
                echo "Digite novamente: "
                CELL
        fi
}

RG(){
	read -p "Informe o número do seu RG: " rg
	echo $rg | grep -E '^[0-9]{2}\.[0-9]{3}\.[0-9]{3}-[0-9a-z]{1,2}$'
	if [ $? == 0 ]; then
		clear
		echo "RG Válido!"
		echo "RG: $rg" >> /projeto/dados/$nome.txt
		sleep 2
		clear
		CPF
	else
		echo "RG Inválido!"
		echo "Digite novamente: "
		sleep 2
		clear
		RG
	fi

}

CPF(){
	read -p "Informe o número do seu CPF: " cpf
	echo $cpf | grep -E '^[0-9]{3}\.[0-9]{3}\.[0-9]{3}-[0-9]{2}$'
	if [ $? == 0 ]; then
		clear 
		echo "CPF Válido!"
		echo "CPF: $cpf" >> /projeto/dados/$nome.txt
		sleep 2
		clear
		DATA
	else
		echo "CPF Inválido!"
		echo "Digite novamente: "
		sleep 2 
	       	clear	
		CPF
	fi
}

DATA(){
	echo "Formato da data: dd/mm/aaaa"
	read -p "Informe sua data de nascimento: " data
	echo $data | grep -E '^[0-9]{2}/[0-9]{2}/[0-9]{4}$'
	if [ $? == 0 ]; then
		clear 
		echo "Data de Nascimento válida!" 
		echo "Data: $data" >> /projeto/dados/$nome.txt
		sleep 2
		clear
		IP
	else
		echo "Data de Nascimento inválida!"
		echo "Digite novamente: "
		sleep 2
		clear
		DATA 
	fi

}

IP(){
	read -p "Informe o número do IP: " ip
	echo $ip | grep -E '^[0-9]{1,3}[.][0-9]{1,3}[.][0-9]{1,3}[.][0-9]{1,3}$'
	if [ $? == 0 ]; then
		clear
		echo "IP Válido!"
	       	echo "IP: $ip" >> /projeto/dados/$nome.txt	
		sleep 2
		clear
		MASCARA
	else
		echo "IP Inválido!"
		echo "Digite novamente: "
		sleep 2
		clear
		IP
	fi
}

MASCARA(){
	read -p "Informe uma máscara: " mascara
	echo $mascara | grep -E '^(254|252|248|240|224|192|128)(.0){3}$|^255(.255|.254|.252|.248|.240|.224|.192|.128|.0){3}$'
	if [ $? == 0 ]; then
	  	clear
		echo "Máscara Válida!" 
		echo "Máscara: $mascara" >> /projeto/dados/$nome.txt
		sleep 1
		echo "Cadastro Concluído!"
	else
		echo "Máscara Inválida!"
		echo "Digite novamente: "
		sleep 1
		clear
		MASCARA
	fi

	cat /projeto/dados/$nome.txt
}	

NOME
