#! /bin/bash
echo "The Linux Console variables are:"
echo
echo "\33 is the escape char, to take an action. Ex: using \033[34m:"
echo -e "\033[34m Hello! \033[0m"
echo
echo " [ is the start, 34 the parameter, m is the letter (action)"
echo " letters can be h, l, m, q, s, u..."
echo " parameters can be 0, 1 (bold), 2 (dim intensity), 5 (blink), 7 (reverse), 11, 25, 27, 30-27 (colors), 4047 (bkgd colors)..."
echo
echo "For example:"
echo -e "\033[5m Hey! \033[0m"
echo
echo "Now, quotes... the black quote is used to execute a cmd (\`cmd\`)"
echo