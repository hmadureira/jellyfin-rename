
#!/bin/bash

# seta a sequencia como 1, para iniciar a numeracao dos episodios
seq=1
# Altera o Input Field Separator para parar de entender o espaço como quebra de linha
IFS=$'\t\n'


# imprimir na tela esperando a entrada da temporada, pra ser usada no script (-p espera uma entrada e mostra o que foi digitado)
read -p 'Temporada: ' season
# se o numero nao for inteiro ele para de executar
if [[ ! $season =~ ^[0-9]+$ ]]; then
echo "Digite somente numeros, sem vírgula ou espaços, tchau!"
exit
fi




# loop que vai listar todos os arquivos da pasta passada quando o bash eh executado e depois altera-los 1 a 1 ate o ultimo,
# fechando o loop variando de acordo com o numero de arquivos. Se nada for passado na variavel $1 ele lista do diretorio corrente (na verdade foi passado o valor de um espaço)
for file in $(ls $1); do
# se a sequencia for menor que 10 joga para uma string com o 0 a esquerda a mais, 
# pois nao consegui tratar os numeros menor (less than) que 10, onde o bash ignora o 0 a esquerda
if [ "$seq" -lt 10 ]
then
#	mv $1/$file $1/""S0"$season"E0"$seq"-"$file"
# echo para testar, se ok liberar a linha acima para fazer a alteração
	echo ""S0"$season"E0"$seq"-"$file" 
else
#	mv $1/$file $1/""S0"$season"E"$seq"-"$file"
	echo ""S0"$season"E"$seq"-"$file"
fi
# incrementa a sequencia e volta o loop do comeco
((seq++))
# fim do loop
done


	

