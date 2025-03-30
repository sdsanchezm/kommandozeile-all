# RegEx

# Curso PLTZ

### Generalidades

- Sirve para encontrar cadenas de caracteres con caracteristicas especificas en archivos o bloques de texto muy grandes, como por ejemplo logs de ngix;
- el punto es **todo** lo que sea un caracter
- Si escribo ". " (punto y espacio), va a buscar un caracter y luego un espacio
- Si escribo ".........." (diez puntos) va a buscar 10 caracteres seguidos
- **Es IMPORTANTE tambien ver como agrupan, o por caracter, o por grupo**

## Predefined Expressions:

### **Dígitos:** \d

- Encuentra todos los dígitos de 0 a 9.
- \d es equivalente a poner [0-9].
- Si en vez de \d, usamos por ejemplo [0-2] nos encontrará solamente los dígitos de 0 a 2.
- Podemos usar “\D” para encontrar justo lo contrario, todo lo que no son dígitos.

### \G
- Afirma la posición al final del match anterior o al inicio de la cadena para el primer match
- Examples 
    - `(?<=\G..)`
        - in this case, .. indicates 2 characters
        - the `?<=` matches
    - `(?<=\G...)`
        - this will only match spaces after 3 characters
    - `(\G..)`
        - this will match groups of 2 characters, starting from the beggining ofthe line, or end of the previous match

### positive Lookbehind and negative Lookbehind 
- positive Lookbehind 
    - `(?<=element)match`
    - Example
        - `(?<=q)p` this expression will match p in valqp but will not match p in valtep
- negative Lookbehind 
    - `(?<!element)match`
    - Example:
        - `(?<!q)p` will match p in ap and bp but it will not match qp

### **Palabras:** \w

- Encuentra todo lo que puede ser parte de una palabra, tanto letras (minúsculas o mayúsculas) como números.
- \w es equivalente a poner [a-zA-Z0-9_].
- Si en vez de \w, usamos por ejemplo [a-zA-Z] nos encontrará solamente las letras.
- Podemos usar “\W” para encontrar justo lo contrario, todos los caracteres que no son parte de palabras.

### Expresiones Importantes

- Encuentra todos los espacios (los saltos de línea también son espacios).
- Podemos usar “\S” para encontrar justo lo contrario, todo lo que no son espacios.

- `^`  denota inicio de linea

- `$`  denota final de linea

- `\d`	A digit: `[0-9]`
- `\D`	A non-digit: `[\^0-9]`
- `\s`	A whitespace character: `[ \t\n\x0B\f\r]`
- `\S`	A non-whitespace character: `[\^\s]`
- `\w`	A word character: `[a-zA-Z0-9]` this could also be: `[0-9a-zA-Z]`
- `\W`	A non-word character: `[\^\w]`

- *  el asterisco es greedy (Matches zero or more occurrences.) greedy, todo - "si no hay, todo bien, pero si hay, matcheelos todos parce"
- +  es uno o mas digitos y seleccion digito por digito (Matches one or more occurrences.) (uno o mas) "tiene que haber algo, o no matchea, y matcheelos todos"
- ?  es el cero o uno (Matches zero or one occurrence.) (cero o uno, puede o no existir) "si no hay, todo bien, pero si hay matchee uno solo parce"

`\t` — Representa un tabulador.

`\r` — Representa el “retorno de carro” o “regreso al inicio” o sea el lugar en que la línea vuelve a iniciar.

`\n` — Representa la “nueva línea” el carácter por medio del cual una línea da inicio. Es necesario recordar que en Windows es necesaria una combinación de \r\n para comenzar una nueva línea, mientras que en Unix solamente se usa \n y en Mac_OS clásico se usa solamente \r.

`\a` — Representa una “campana” o “beep” que se produce al imprimir este carácter.

`\e` — Representa la tecla “Esc” o “Escape”

`\f` — Representa un salto de página

`\v` — Representa un tabulador vertical

`\x` — Se utiliza para representar caracteres ASCII o ANSI si conoce su código. De esta forma, si se busca el símbolo de derechos de autor y la fuente en la que se busca utiliza el conjunto de caracteres Latin-1 es posible encontrarlo utilizando “\xA9”.

`\u` — Se utiliza para representar caracteres Unicode si se conoce su código. “\u00A2” representa el símbolo de centavos. No todos los motores de Expresiones Regulares soportan Unicode. El .Net Framework lo hace, pero el EditPad Pro no, por ejemplo.

`\d` — Representa un dígito del 0 al 9.

`\w` — Representa cualquier carácter alfanumérico.

`\s` — Representa un espacio en blanco.

`\D` — Representa cualquier carácter que no sea un dígito del 0 al 9.

`\W` — Representa cualquier carácter no alfanumérico.

`\S` — Representa cualquier carácter que no sea un espacio en blanco.

`\A` — Representa el inicio de la cadena. No un carácter sino una posición.

`\Z` — Representa el final de la cadena. No un carácter sino una posición.

`\b` — Marca la posición de una palabra limitada por espacios en blanco, puntuación o el inicio/final de una cadena.

`\B`— Marca la posición entre dos caracteres alfanuméricos o dos no-alfanuméricos.

`\t` — Representa un tabulador.

`\r` — Representa el “retorno de carro” o “regreso al inicio” o sea el 
lugar en que la línea vuelve a iniciar.

`\n` — Representa la “nueva línea” el carácter por medio del cual una 
línea da inicio. Es necesario recordar que en Windows es necesaria una combinación de \r\n para comenzar una nueva línea, mientras que en Unix solamente se usa \n y en Mac_OS clásico se usa solamente \r.

`\a` — Representa una “campana” o “beep” que se produce al imprimir este carácter.

`\e` — Representa la tecla “Esc” o “Escape”

`\f`— Representa un salto de página

`\v` — Representa un tabulador vertical

`\x` — Se utiliza para representar caracteres ASCII o ANSI si conoce su 
código. De esta forma, si se busca el símbolo de derechos de autor y la 
fuente en la que se busca utiliza el conjunto de caracteres Latin-1 es 
posible encontrarlo utilizando “\xA9”.

`\u` — Se utiliza para representar caracteres Unicode si se conoce su 
código. “\u00A2” representa el símbolo de centavos. No todos los motores de Expresiones Regulares soportan Unicode. El .Net Framework lo hace, pero el EditPad Pro no, por ejemplo.

`\d` — Representa un dígito del 0 al 9.

`\w` — Representa cualquier carácter alfanumérico.

`\s` — Representa un espacio en blanco.

`\D` — Representa cualquier carácter que no sea un dígito del 0 al 9.

`\W` — Representa cualquier carácter no alfanumérico.

`\S` — Representa cualquier carácter que no sea un espacio en blanco.

`\A` — Representa el inicio de la cadena. No un carácter sino una 
posición.

`\Z` — Representa el final de la cadena. No un carácter sino una posición.

`\b` — Marca la posición de una palabra limitada por espacios en blanco, 
puntuación o el inicio/final de una cadena.

`\B` — Marca la posición entre dos caracteres alfanuméricos o dos 
no-alfanuméricos.

### Contadores:

- **\d{0,2}:** Esto buscara 0, 1, 2 dígitos
- **\d{2,2}:** Esto buscara 2 dígitos
- **\d{2}:** Esto buscara 2 dígitos
- **\d{2,}:** Esto buscara 2 o más dígitos.
- **\d{2,4}:** Esto buscara 2, 3, 4 dígitos.

### Examples RegEx expressions:

- `[a-fA-F0-9]` - buscar minusculas, mayus, y digitos
- `[a-fA-F0-9\.]` // this is the escape for the point \.
- `[a-fABCDEF0-9\.]` - buscar de la `a` a la `f` y `A` a la `F` con digitos y punto al final
- `.`  - es cualquier caracter
- `.*` - encuentra todos los caracteres y selecciona todo
- `[á-ü]` esto sirve par matchear todos las vocales acentuadas
- `\d?` - **agrupa por caracter**, **NO** el conjunto
- `\d*` - **agrupa el conjunto**, agrupa por conjunto, **SI** el conjunto
- `\d+` - **agrupa todo el conjunto** pero si o si tiene que haber digitos
- `[a-z]` esto es una clase, por que esta en square brackets
- `\d+[a-z]` - si o si, tiene que encontrar un digito antes de la letra, y selecciona todos los digitos
- `\d*[a-z]` - puede o no encontrar un digito, y selecciona el conjunto de digitos antes de la letra
- `\d?[a-z]` - puede o no encontrar un digito, y selecciona solo el digito.
- `\d*[a-z]?s` -
    - Digitos con * que sea 0 o ninguno pero los selecciona todos
    - De la a a la z terminado ? significa que puede haber o no, pero solo selecciona solo 1 catacter.
    - La s si o si tiene que estar.
- `\d*[a-z]?s\d*` -
    - Los digitos pueden o no existir, selecciona todo
    - De la a la z pueden o no existir, selecciona 1
    - La s tiene que existir
    - Y los digitos puede o no existir, selecciona todo
    - **\d*[a-z]?s\d -**
        - first digit can or not exist, if so select all digits
        - a to z can or nor exist, if so, select only 1 a to z
        - must be a s
        - should be 1 digit
    - **\d*[a-z]?s\d* -**
        - first digit can or not exist, if so select all digits
        - a to z can or nor exist, if so, select only 1 a to z
        - must be a s
        - select all digits
    - **\d*[a-z]?s\d? -**
        - first digit can or not exist, if so select all digits
        - a to z can or nor exist, if so, select only 1 a to z
        - must be a s
        - select only 1 digit
            
            ![**`\d*[a-z]?s\d+`** ](img/a.png)
            
            **`\d*[a-z]?s\d+`** 
            
- `\d\d`
    - Busca 2 digitos (\d\d\d buscaria 3)
- `\d{3}`
    - Busca 3 digitos
- `\d{2,3}`
    - minimo 2 y maximo 3
- `\d{2,3}[\-\. ]?`
    - encuenta de 2 a 3 digitos
    - encuentra - o . o " " (espacio) (si existe o no)
- `\d{2,3}[\-\. ]?\d{2,3}[\-\. ]?\d{2,3}[\-\. ]?`
    - Aqui es lo mismo que el anterior, pero 3 veces
    - Se puede reescribir asi:
        - `(\d{2,2}[\-\.]?){3,3}`
- `((\d\d[ -.]?){4}\d\d)` este tambien funcionaria
- `.+,`
    - esta selecciona todos los caracteres, antes de la coma
- `.+?,`
    - esta (matchea o hace match) selecciona todos el caracteres antes de la coma, pero el resultado lo hace lo mas pequeno posible
- `.+?[,\n]{1,1}`
    - this expression works to select every expression in a csv, including the last column
- `[^0-5a-c ]`
    - Negando del 0 al 5 y de la a a la c
- \d\d\D?\d\d\D?\d\d
    - en esta expresion, el match es dos digitos, luego un caracter que puede estar o no, y si esta, no debe ser digito
- ^[aeiou]
    - Matches all lines that starts with aeiou
- ^[^aeiou]
    - Matches all lines that DO NOT starts with aeiou
    - en SQL, se usaria → WHERE REGEX = '^[^aeiou]';
- Para este ejemplo de formato:
    - 565811
    56-58-11
    56-58.11
    56 58 11
    56.58.11
    56t58x11
    - es requerido matchear todos los records, excepto la ultima linea
    - \d\d[^\d\w]?\d\d[^\d\w]?\d\d
        - Dos digitos, luego (algo que no sea digito o que no sea palabra) y puede o no existir; ← repetido 3 veces.
        - Se podria, re-escribir asi:
    - (\d{2,2}\W?){3}
        - funcionaria
    - (\d{2,2}[^\d\w]?){3}
        - funcionaria tambien
- ^ e el inicio de linea, y el $ es el final de la linea
- `^\d$`
    - selecciona todas las lineas (selecciona lineas en este caso, no matches)
    - selecciona todas las lineas que empiecen en digito y termine en digito y que solamente tenga un digito
- `^\d{3,}$`
    - esta expresion, selecciona toda la linea con minimo 3 digitos
- `^\d{3,7}$`
    - esta expresion selecciona toda la linea que tenga entre 3 y 7 digitos
- `^[^\d].*$`
    - selecciona todas las lineas que no empiecen con un digito
    - el .* se pone para seleccionar el conjunto
- `^\[LOG.*\[LOG\].*user:@ss\]` (estas expresiones sirven para matchear **LOGS**)
    - ayuda a encontrar matches como este: 
    [LOG ENTRY] [LOG] [user:@ss] Rated the app2
    [LOG ENTRY] [LOG] [user:@ss] Rated the daemon process
- `^\[LOG.*\[LOG\].**user:@ss\].**$`
    - in this version, the $ is included, and work exactly the same (idk why)
- `^\[LOG.*\] \[LOG\].**user:@\w+?\] .**$`
    - kind of the same thing, but nice to analize
- `\w+?`
    - matchea caracter por caracter
- `\w+`
    - matchea el grupo
- Esta expresion sirve para encontrar las direcciones IP en un LOG:
    
    ```regex
    `^.(\d{2,3}[.]?){4,4}.$`
    ```
    
- (?<=[cbc:Name](cbc:Name)>).+(?=<\/cbc:Name>)
    - nice example to find things specifically in an **XML**
    - For example, this one: </cbc:IndustryClassificationCode>[cac:PartyName](cac:PartyName)[cbc:Name](cbc:Name)Empresa S.A.S</cbc:Name></cac:PartyName>
- ^.**(\d{2,3}[.]?){4,4}.*$
    - Esta expresion, sirve para encontrar direcciones IP en un log
- ^\+?(\d{2,3}[^\da-z]?){3}[#pe]?\d*$
    - this is an expression to match **PHONE NUMBERS**
    - it is using a counter, but it can also don't use it
    - without counter, it could be like this:  ^\+?\d{2,3}[^\da-z]?\d{2,3}[^\da-z]?\d{2,3}[#pe]?\d*$
    - Explanation of this expression:^\+?\d{2,3}[^\da-z]?\d{2,3}[^\da-z]?\d{2,3}[#pe]?\d*$
        - ^ starting the line
        - \+? could be a + be or not
        - \d{2,3} 2 to 3 digits must match
        - [^\da-z]? digits and characters from a to z must not appear (is in negation with ^) and al lthis, could or not appear (because the ?)
        - The previous line is repeated 3 times, so it could also be replaced by a counter {2,3}
        - the expression: [#pe]? means that or # or p or e should match or not
        - \d* matchea todos los digitos de ahi para adelante
- The following expression is for **URLs:**
    - https?:\/\/[\w-\.]+\/?
        - esta sirve para matchear TLD (Top Level Domains) como [https://este.es.un.dominio.com](https://este.es.un.dominio.com)
    - https?:\/\/[\w\-\.]+\.\w{2,5}
        - esta sirve para matchear todos los dominios, tambien
    - https?:\/\/[\w\-\.]+\.\w{2,5}\/?\S*
        - esta sirve para sacar todas las url netas, sin text luego del url
    - https?\S*
        - this one works for similar
- Working with **EMAILS**:
    - `^[\w\._]{5,30}(\+[\w]{0,10})?@[\w\.\-]{3,}?\.\w{2,5}$`
        - In linux, this expression can be used as well, like this:
            - grep -P '`^[\w\._]{5,30}(\+[\w]{0,10})?@[\w\.\-]{3,}?\.\w{2,5}$`' correos.txt\
    - From the course:
        - `[\w\._]{5,30}\+?[\w]{0,10}@[^\d][\w\.\-]{3,}\.\w{2,5}`
            - sirvio similar.
- Localizacion:
    - Por ejemplo para expresiones de este estilo: 99.205646,19.429707,2275.10 que son **COORDENADAS,** podemos usar:
        - `^\-?\d{1,3}\.\d{1,6},\s?\-?\d{1,3}\.\d{1,6},.*$`
    - para coordenadas del estilo: 99 12' 34.08"W, 19 34' 56.98"N podemos usar este:
        - `^\-?\d{1,3}\s\d{1,2}'\s\d{1,2}\.\d{2,2}"[WE],\s?\-?\d{1,3}\s\d{1,2}'\s\d{1,2}\.\d{2,2}"[NS]$`
    - \s? Esto es, si hay o no espacio
- Nombres
    - `^([A-ZÑÁÉÍÓÚ][a-zñáéíóú]+\s?){3,4}$`
        - esta es un primer approach con un ejemploe especifico
    - `^[A-Z][a-z]{3,}\s?[A-Z]?[a-z]{0,}$`
- Find a substring of length greater than 1 that starts and ends with same character.
    
    ```jsx
    (.).*\1
    ```
    
- This expression, looks for the vowel at the beggining and at the end of the expression in each line:
    
    ```jsx
    `/^([aeiou]).*\1$/`
    ```
    
- Busqueda y Reemplazo:
    - Cuando se usan parentesis, se llaman grupos. Los grupos, permiten hacer reemplazos, usando Replace All y las expresiones $1 para referirse al primer grupo; $2 para referirse al segundo grupo, y asi sucesivamente.
    - Por ejemplo, en esta expresion:
    
    ```jsx
    `^\d+::([\w\s,\(\)'\.\-&!\/éíìó]+)\s\((\d\d\d\d)\)::.*$`
    ```
    
    - Hay 2 grupos: el primero es: el primer parentesis:
    
    ```jsx
    `([\w\s,\(\)'\.\-&!\/éíìó]+)`
    ```
    
    - Y el segundo es el segundo parentesis:
    
    ```jsx
    `(\d\d\d\d)`
    ```
    
    - Para el siguiente piea de texto:
    
    > 1::Toy Story (1995)::Adventure|Animation|Children|Comedy|Fantasy
    2::Jumanji (1995)::Adventure|Children|Fantasy
    3::Grumpier Old Men (1995)::Comedy|Romance
    4::Waiting to Exhale (1995)::Comedy|Drama|Romance
    5::Father of the Bride Part II (1995)::Comedy
    6::Heat (1995)::Action|Crime|Thriller
    7::Sabrina (1995)::Comedy|Romance
    8::Tom and Huck (1995)::Adventure|Children
    9::Sudden Death (1995)::Action
    > 
    - La siguiente expresion funciona:
    
    ```jsx
    `^\d+::([\w\s,\(\)'\.\-&!\/éíìó]+)\s\((\d\d\d\d)\)::.*$`
    ```
    
    - Para **REEMPLAZAR**, se hace click en Reemplazar y se excribe asi (para SQL) -luego click en reemplazar all or replace onlye one-, that should work:
    
    ```jsx
    INSERT INTO MOVIES (year, title) values($2, '$1'); 
    ```
    
    - the result is this (ready **SQL**):
    
    > insert into movies (year, title) values(1995, 'Toy Story');
    insert into movies (year, title) values(1995, 'Jumanji');
    insert into movies (year, title) values(1995, 'Grumpier Old Men');
    insert into movies (year, title) values(1995, 'Waiting to Exhale');
    insert into movies (year, title) values(1995, 'Father of the Bride Part II');
    insert into movies (year, title) values(1995, 'Heat');
    insert into movies (year, title) values(1995, 'Sabrina');
    insert into movies (year, title) values(1995, 'Tom and Huck');
    insert into movies (year, title) values(1995, 'Sudden Death');
    insert into movies (year, title) values(1995, 'GoldenEye');
    > 
    - para crear objetos **JSON,** se podria usar el reemplazo:
    
    ```jsx
    {title:"$1", year:$2},
    ```
    
    - **GET** method expressions:
        - Teniendo el link: [http://b3co.com/?s=fotografia$mode=search&module=blog](http://b3co.com/?s=fotografia$mode=search&module=blog) y tambien [https://davs.tech/?kk1=text&var=dark&visual=disabled&x=qwe](https://davs.tech/?kk1=text&var=dark&visual=disabled&x=qwe)
            - La expresion para este caso, seria:
            
            ```jsx
            [[\?&](notion://www.notion.so/%5Cw+)]=([^&\n]+) 
            ```
            
            - El Reemplazo, se haria tambien copiando un salto de linea, el resultado quedaria mas o menos asi:
             
            `$1 = $2`
            
            > [http://b3co.com/](http://b3co.com/)
            s = fotografia
            mode = search
            module = blog
            [https://davs.tech/](https://davs.tech/)
            kk1 = text
            var = dark
            visual = disabled
            x = qwe
            > 
    - In **PERL**:
    
    ```perl
    #!/usr/bin/perl
    
    use strict;
    use warnings;
    
    my $t = time;
    
    open(my $f, "results.csv") or die ("no file here man");
    
    my $match = 0;
    my $nomatch = 0;
    # Example of Type of text
    # 2005-01-26,Ecuador,Panama,2,0,Friendly,Ambato,Ecuador,FALSE
    # 1881-03-14,Wales,Scotland,1,5,Friendly,Wrexham,Wales,FALSE
    while(<$f>){
      chomp;
      if(m/^([\d]{4,4})\-.*?,(.*?),(.*?),(\d+),(\d+),.*$/){ # la Regex va aca; m es de match, debe ir ; todas les Regex va / aqui adentro / (dentro de los slash);
        if( $5 > $4 ){ # $0 es la cadena completa
            printf("%s: %s (%d) - (%d) %s\n", $1, $2, $4, $5, $3);
        }
        #print $_."\n";
        $match++;
      } else {
        $nomatch++;
      }
    }
    
    close ( $f );
    
    printf("Found %d matches...\n", $match);
    printf("No matches found: %d \n", $nomatch);
    printf("Se demoro: %d segundos", time() - $t );
    ```
    
    - **Lista de Flags** usados en los slash cuando se integra con lenguages, como perl, php: (Ejemplo / regExp /i ) #aqui se uso la i, de insensitive
    - **`i`** Con este indicador, la búsqueda no distingue entre mayúsculas y minúsculas: no hay diferencia entre A y a
    - **`g`** Con esta marca, la búsqueda busca todas las coincidencias, sin ella, solo se devuelve la primera coincidencia.
    - **`m`** Modo multilínea
    - **`s`** Habilita el modo “dotall”, que permite un punto. para que coincida con el carácter de nueva línea \ n
    - **`u`** Permite el soporte completo de Unicode. La bandera permite el procesamiento correcto de pares sustitutos.
    - **`y`** Modo “adhesivo”: búsqueda en la posición exacta del texto
    
    ### RegEx In **PHP** , This is the besic form :
    
    ```perl
    <?php
    
    $file = fopen("results.csv", "r");
    
    $match = 0;
    $nomatch = 0;
    
    # 2005-01-26,Ecuador,Panama,2,0,Friendly,Ambato,Ecuador,FALSE
    # 1881-03-14,Wales,Scotland,1,5,Friendly,Wrexham,Wales,FALSE
    
    while(!feof($file)){
      $line = fgets($file);
      if(preg_match( # has to use this function to include the RegEx 
        '/^2018\-01\-(\d\d),.*$/', #the regular RegEx comes here
        $line,
        $m
      )){
          print_r($m);
          $match++;
      } else{
          $nomatch++;
      }
    }
    
    fclose( $file );
    
    printf("\n\nmatch: %d\nno match: %d\n", $match, $nomatch);
    
    ?>
    ```
    
    - This is a most complete example, php returns an Array. So we gotta work with those arrays, in order to make calculations:
        
        ```perl
        <?php
        
        $file = fopen("results.csv", "r");
        
        $match = 0;
        $nomatch = 0;
        
        # 2005-01-26,Ecuador,Panama,2,0,Friendly,Ambato,Ecuador,FALSE
        # 1881-03-14,Wales,Scotland,1,5,Friendly,Wrexham,Wales,FALSE
        
        while(!feof($file)){
          $line = fgets($file);
          if(preg_match( # have to use this function in order to work 
            '/^(\d{4}\-\d\d\-\d\d),(.+),(.+),(\d+),(\d+),.*$/i', #Regular expression is here
            $line,
            $m
          )){
              if($m[4] == $m[5]){
                echo "Empate: ";
              } elseif ( $m[4] > $m[5] ) {
                echo "Local:   ";
              } else {
                echo "Visitante: ";
              }
              printf ("\t%s - %s [%d - %d]\n", $m[2], $m[3], $m[4], $m[5]);
              $match++;
          } else{
              $nomatch++;
              # echo $line; #para mostrar los nomatches
          }
        }
        
        fclose( $file );
        
        printf("\n\nmatch: %d\nno match: %d\n", $match, $nomatch);
        
        ?>
        ```
        
    
    ### RegEx in **Python**
    
    ```python
    import re
    
    # 2005-01-26,Ecuador,Panama,2,0,Friendly,Ambato,Ecuador,FALSE
    # 1881-03-14,Wales,Scotland,1,5,Friendly,Wrexham,Wales,FALSE
    
    pattern = re.compile(r'^([\d]{4,4})\-\d\d\-\d\d,(.+),(.+),(\d+),(\d+),.*$')
    
    f = open("results.csv", "r", encoding = "utf-8" )
    
    for line in f:
        res = re.match(pattern, line)
        if res:
            totalgoals = int(res.group(4)) + int(res.group(5))
            if totalgoals > 10:
                print("Goles: {}, {}  {}, {} [{} - {}]".format( totalgoals, res.group(1), res.group(2), res.group(3), res.group(4), res.group(5), ) )
    
    f.close()
    ```
    
    ### Regex en **JAVA**
    
    - Para correrlo, hay que instalar java.
    - Para compilar: `javac[javaregex.java](http://javaregex.java)` *( el archivo fuente se tiene que llamar igual que la clase, "javaregex" en este caso)*
    - y para correr: `java javaregex`
    
    ```java
    import java.io.BufferedReader;
    import java.io.FileReader;
    import java.io.IOException;
    import java.util.regex.Pattern;
    import java.util.regex.Matcher;
    
    public class javaregex {
      public static void main(String[] args){
        String file = "results.csv";
    
        //Pattern pat = Pattern.compile("^2011\\-.*$");
        Pattern pat = Pattern.compile("^2011\\-.*[zk].*$");
    
        try{
          BufferedReader br = new BufferedReader(new FileReader(file));
          String line;
          while((line = br.readLine()) != null ) {
            Matcher matcher = pat.matcher(line);
            if( matcher.find() ){
              System.out.println(line);
            }
            //System.out.println(line);
          }
        } catch (Exception e){
          System.out.println("nope!");
        }
      }
    }
    ```
    
    ### RegEx in Javascript:
    
    - necesita la funcion `match` para poder escribir ahi las expresiones regulares.
    - Documentacion nice: [https://www.hackerrank.com/challenges/js10-regexp-1/topics/javascript-regex](https://www.hackerrank.com/challenges/js10-regexp-1/topics/javascript-regex)
    
    ```jsx
    <!DOCTYPE html>
    <html lang="en">
    <head>
      <meta charset="UTF-8">
      <meta name="viewport" content="width=device-width, initial-scale=1.0">
      <meta http-equiv="X-UA-Compatible" content="ie=edge">
      <title>Js Regex</title>
    
      <style>
        body {
          font-family: Arial;
        }
    
        input {
          font-size: 18px;
          padding: 6px;
        }
    
      </style>
    </head>
    <body>
      <input type="text" id="email" placeholder="Your Email" onkeyup="validate(this.value)" autofocus>
      <input type="button" id="button" value="submit" class="btn disabled" onclick="correct()" disabled>
    
      <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
      <script>
        const button = document.getElementById('button')
    
        function validate(email) {
          if(email.match(/^[^@]+@[\w\.]{2,10}\.[\w]{2,5}$/i)) {
            button.disabled = false
            button.classList.remove('disabled')
          } else {
            button.disabled = true
            button.classList.add('disabled')
          }
        }
    
        function correct() {
          swal({
            title: 'Congratulations!',
            text: 'This is a correct Email',
            icon: 'success',
            button: 'Thank\'s'
          })
        }
      </script>
    </body>
    </html>
    ```
    
    ## **GREP** en linux o Cygwin, permite procesar RegEx asi:
    
    - `cat` imprime en pantalla un archivo y se debe poner el pipe `|`  y luego si grep para empezar a escribir la expresion regular
    - Forma 1
    
    ```bash
    cat ./results.csv | grep ,3[0-9] 
    ```
    
    - Forma 2 (tambien funciona asi, entre comillas simples):
        
        ```bash
        cat results.csv | grep '^2011.*$' 
        ```
        
    - por ejemplo, todos los resultados que terminen en SE:
    
    ```bash
    cat ./results.csv | grep SE$ 
    ```
    
    - cheat-sheet for RegEx on GREP: [https://ryanstutorials.net/linuxtutorial/cheatsheetgrep.php](https://ryanstutorials.net/linuxtutorial/cheatsheetgrep.php)
    
    // curso de platzi!