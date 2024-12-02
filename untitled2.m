function baseConversionApp  

    fig = uifigure('Position', [500, 500, 400, 350], 'Name', 'Conversión de Bases');  

    uilabel(fig, 'Position', [20, 290, 100, 30], 'Text', 'Número 1 (base 10):');  

    num1Field = uieditfield(fig, 'numeric', 'Position', [130, 290, 100, 30]); 

    uilabel(fig, 'Position', [20, 250, 100, 30], 'Text', 'Número 2 (base 10):');  

    num2Field = uieditfield(fig, 'numeric', 'Position', [130, 250, 100, 30]);  

    uilabel(fig, 'Position', [20, 210, 100, 30], 'Text', 'Número 3 (base 10):');  

    num3Field = uieditfield(fig, 'numeric', 'Position', [130, 210, 100, 30]);  

    uilabel(fig, 'Position', [20, 170, 100, 30], 'Text', 'Seleccione la base:');  

    baseDropdown = uidropdown(fig, 'Items', {'2', '3', '4', '5', '6', '7', '8', '9', '10', '11', '12', '13', '14', '15'}, 'Position', [130, 170, 100, 30]);  

    convertButton = uibutton(fig, 'push', 'Text', 'Convertir', 'Position', [150, 130, 100, 30],'ButtonPushedFcn', @(btn, event) realizarConversion());  

  

    resultLabel = uilabel(fig, 'Position', [20, 90, 350, 30], 'Text', '');  

  

    sumLabel = uilabel(fig, 'Position', [20, 60, 350, 30], 'Text', '');  

  

    symbolsLabel = uilabel(fig, 'Position', [20, 30, 350, 30], 'Text', '');  

  

    function realizarConversion()  

  

        numero1 = num1Field.Value;  

  

        numero2 = num2Field.Value;  

  

        numero3 = num3Field.Value;  

  

        base = str2double(baseDropdown.Value);  

  

   

  

        resultado1 = convertirBase(numero1, base);  

        resultado2 = convertirBase(numero2, base);  

        resultado3 = convertirBase(numero3, base);  

        sumaBase10 = numero1 + numero2 + numero3;  

        sumaConvertida = convertirBase(sumaBase10, base);  

        [nombreBase, simbolosBase] = obtenerBase(base);  

        resultLabel.Text = sprintf('Números convertidos: %s, %s, %s', resultado1, resultado2, resultado3);  

        sumLabel.Text = sprintf('Suma en %s: %s', nombreBase, sumaConvertida);  

        symbolsLabel.Text = sprintf('Símbolos en la base %s: %s', nombreBase, simbolosBase);  

    end  

    function resultado = convertirBase(num, base)  

        if base < 2 || base > 15  

            error('La base debe estar entre 2 y 15');  

        end  

        simbolos = '0123456789ABCDEF';  

        if num == 0  

            resultado = '0';  

            return;  

        end  

        resultado = '';  

        while num > 0  

            residuo = mod(num, base);  

            resultado = [simbolos(residuo + 1), resultado];  

            num = floor(num / base);  

        end  

    end  

    function [nombreBase, simbolos] = obtenerBase(base)  

        if base < 2 || base > 15  

            error('La base debe estar entre 2 y 15');  

        end  

        simbolos = '0123456789ABCDEF';  

        nombreBase = sprintf('Base %d', base);  

        simbolos = simbolos(1:base);  

    end  

end 