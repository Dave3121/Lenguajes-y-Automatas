using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

/*
    Requerimiento 1: Mensajes del printf deben salir sin comillas
                     Incluir \n y \t como secuencias de escape
    Requerimiento 2: Agregar el % al PorFactor
                     Modifcar el valor de una variable con ++,--,+=,-=,*=,/=.%=
    Requerimiento 3: Cada vez que se haga un match(Tipos.Identificador) verficar el
                     uso de la variable
                     Icremento(), Printf(), Factor() y usar getValor y Modifica
                     Levantar una excepcion en scanf() cuando se capture un string
    Requerimiento 4: Implemenar la ejecución del ELSE
*/

namespace Sintaxis_2
{
    public class Lenguaje : Sintaxis
    {
        List<Variable> lista;
        Stack<float> stack;
        int countelse = 0;
        public Lenguaje()
        {
            lista = new List<Variable>();
            stack = new Stack<float>();
        }
        public Lenguaje(string nombre) : base(nombre)
        {
            lista = new List<Variable>();
            stack = new Stack<float>();
        }

        //Programa  -> Librerias? Variables? Main
        public void Programa()
        {
            if (getContenido() == "#")
            {
                Librerias();
            }
            if (getClasificacion() == Tipos.TipoDato)
            {
                Variables();
            }
            Main(true);
            Imprime();
        }

        private Variable.TiposDatos getTipo(string nombre)
        {
            foreach (Variable v in lista)
            {
                if (v.getNombre() == nombre)
                {
                    return v.getTiposDatos();
                }
            }
            return Variable.TiposDatos.Char;
        }

        private Variable.TiposDatos getTipo(float resultado)
        {
            if(resultado%1==0)
            {
                return Variable.TiposDatos.Float;
            }
            else if (resultado < 256)
            {
                return Variable.TiposDatos.Char;
            }
            else if (resultado < 65536)
            {
                return Variable.TiposDatos.Int;
            }
            return Variable.TiposDatos.Float;
        }

        private void Imprime()
        {
            log.WriteLine("-----------------");
            log.WriteLine("V a r i a b l e s");
            log.WriteLine("-----------------");
            foreach (Variable v in lista)
            {
                log.WriteLine(v.getNombre() + " " + v.getTiposDatos() + " = " + v.getValor());
            }
            log.WriteLine("-----------------");
        }

        private bool Existe(string nombre)
        {
            foreach (Variable v in lista)
            {
                if (v.getNombre() == nombre)
                {
                    return true;
                }
            }
            return false;
        }
        private void Modifica(string nombre, float nuevoValor)
        {
            foreach (Variable v in lista)
            {
                if (v.getNombre() == nombre)
                {
                    v.setValor(nuevoValor);
                }
            }
        }
        private float getValor(string nombre)
        {
            foreach (Variable v in lista)
            {
                if (v.getNombre() == nombre)
                {
                    return v.getValor();
                }
            }
            return 0;
        }
        // Libreria -> #include<Identificador(.h)?>
        private void Libreria()
        {
            match("#");
            match("include");
            match("<");
            match(Tipos.Identificador);
            if (getContenido() == ".")
            {
                match(".");
                match("h");
            }
            match(">");
        }
        //Librerias -> Libreria Librerias?
        private void Librerias()
        {
            Libreria();
            if (getContenido() == "#")
            {
                Librerias();
            }
        }
        //Variables -> tipo_dato ListaIdentificadores; Variables?
        private void Variables()
        {
            Variable.TiposDatos tipo = Variable.TiposDatos.Char;
            switch (getContenido())
            {
                case "int": tipo = Variable.TiposDatos.Int; break;
                case "float": tipo = Variable.TiposDatos.Float; break;
            }
            match(Tipos.TipoDato);
            ListaIdentificadores(tipo);
            match(";");
            if (getClasificacion() == Tipos.TipoDato)
            {
                Variables();
            }
        }
        //ListaIdentificadores -> identificador (,ListaIdentificadores)?
        private void ListaIdentificadores(Variable.TiposDatos tipo)
        {
            if (!Existe(getContenido()))
            {
                lista.Add(new Variable(getContenido(), tipo));
            }
            else
            {
                throw new Error("de sintaxis, la variable <" + getContenido() + "> está duplicada", log, linea, columna);
            }
            match(Tipos.Identificador);
            if (getContenido() == ",")
            {
                match(",");
                ListaIdentificadores(tipo);
            }
        }
        //BloqueInstrucciones -> { ListaInstrucciones ? }
        private void BloqueInstrucciones(bool ejecuta)
        {
            //Console.WriteLine("Inicio de bloque de instrucciones--------");
            match("{");
            if (getContenido() != "}")
            {
                ListaInstrucciones(ejecuta);
            }
            match("}");
            //Console.WriteLine("Fin de bloque de instrucciones--------");
        }

        //ListaInstrucciones -> Instruccion ListaInstrucciones?
        private void ListaInstrucciones(bool ejecuta)
        {
            Instruccion(ejecuta);
            if (getContenido() != "}")
            {
                ListaInstrucciones(ejecuta);
            }
        }
        //Instruccion -> Printf | Scanf | If | While | Do | For | Asignacion
        private void Instruccion(bool ejecuta)
        {
            if (getContenido() == "printf")
            {
                Printf(ejecuta);
            }
            else if (getContenido() == "scanf")
            {
                Scanf(ejecuta);
            }
            else if (getContenido() == "if")
            {
                If(ejecuta);
            }
            else if (getContenido() == "while")
            {
                While(ejecuta);
            }
            else if (getContenido() == "do")
            {
                Do(ejecuta);
            }
            else if (getContenido() == "for")
            {
                For(ejecuta);
            }
            else
            {
                Asignacion(ejecuta);
            }
        }
        //Asignacion -> identificador = Expresion;
        private void Asignacion(bool ejecuta)
        {
            if (!Existe(getContenido()))
            {
                throw new Error("de sintaxis, la variable <" + getContenido() + "> no está declarada", log, linea, columna);
            }
            log.Write(getContenido() + " = ");
            string variable = getContenido();
            match(Tipos.Identificador);
            if (getContenido() == "=")
            {
                match("=");
                Expresion();
            }
            else if (getClasificacion() == Tipos.IncrementoTermino)
            {
                if (getContenido() == "++")
                {
                    match("++");
                    stack.Push(getValor(variable) + 1);

                }
                else if (getContenido() == "--")
                {
                    match("--");
                    stack.Push(getValor(variable) - 1);
                }

            }
            // else if (getClasificacion() == Tipos.OperadorFactor)
            // {
            if (getContenido() == "+=")
            {
                match("+=");
                Expresion();
                float NuevoValor = getValor(variable) + stack.Pop();
                stack.Push(NuevoValor);

            }
            else if (getContenido() == "-=")
            {
                match("-=");
                Expresion();
                float NuevoValor = getValor(variable) - stack.Pop();
                stack.Push(NuevoValor);

            }
            else if (getContenido() == "*=")
            {
                match("*=");
                Expresion();
                float NuevoValor = getValor(variable) * stack.Pop();
                stack.Push(NuevoValor);

            }
            else if (getContenido() == "/=")
            {
                match("/=");
                Expresion();
                float NuevoValor = getValor(variable) / stack.Pop();
                stack.Push(NuevoValor);

            }
            else if (getContenido() == "%=")
            {
                match("%=");
                Expresion();
                float NuevoValor = getValor(variable) % stack.Pop();
                stack.Push(NuevoValor);
            }
            //}
            float resultado = stack.Pop();
            log.WriteLine(" = " + resultado);
            if (ejecuta)
            {
                Variable.TiposDatos tipoDatoVariable = getTipo(variable);
                Variable.TiposDatos tipoDatoResultado = getTipo(resultado);

                Console.WriteLine(variable + " = " + tipoDatoVariable);
                Console.WriteLine(variable + " = " + tipoDatoResultado);
                Modifica(variable, resultado);
            }

            match(";");
        }
        //While -> while(Condicion) BloqueInstrucciones | Instruccion
        private void While(bool ejecuta)
        {
            match("while");
            match("(");
            Condicion();
            match(")");
            if (getContenido() == "{")
            {
                BloqueInstrucciones(ejecuta);
            }
            else
            {
                Instruccion(ejecuta);
            }

        }
        //Do -> do BloqueInstrucciones | Instruccion while(Condicion)
        private void Do(bool ejecuta)
        {
            match("do");
            if (getContenido() == "{")
            {
                BloqueInstrucciones(ejecuta);
            }
            else
            {
                Instruccion(ejecuta);
            }
            match("while");
            match("(");
            Condicion();
            match(")");
            match(";");
        }
        //For -> for(Asignacion Condicion; Incremento) BloqueInstrucciones | Instruccion
        private void For(bool ejecuta)
        {
            match("for");
            match("(");
            Asignacion(ejecuta);
            Condicion();
            match(";");
            Incremento(ejecuta);
            match(")");
            if (getContenido() == "{")
            {
                BloqueInstrucciones(ejecuta);
            }
            else
            {
                Instruccion(ejecuta);
            }
        }
        //Incremento -> Identificador ++ | --
        private void Incremento(bool ejecuta)
        {
            string variable = getContenido();
            if (!Existe(variable))
            {
                throw new Error("de sintaxis, la variable <" + variable + "> no está declarada", log, linea, columna);
            }
            stack.Push(getValor(variable));
            match(Tipos.Identificador);

            if (getContenido() == "++")
            {
                match("++");
            }
            else
            {
                match("--");
            }
        }
        //Condicion -> Expresion OperadorRelacional Expresion
        private bool Condicion()
        {
            Expresion();
            string operador = getContenido();
            match(Tipos.OperadorRelacional);
            Expresion();
            float R1 = stack.Pop();
            float R2 = stack.Pop();

            switch (operador)
            {
                case "==": return R2 == R1;
                case ">": return R2 > R1;
                case ">=": return R2 >= R1;
                case "<": return R2 < R1;
                case "<=": return R2 <= R1;
                default: return R2 != R1;
            }
        }
        //If -> if (Condicion) BloqueInstrucciones | Instruccion (else BloqueInstrucciones | Instruccion)?
        private void If(bool ejecuta)
        {
            match("if");
            match("(");
            bool evaluacion = Condicion() && ejecuta;
            match(")");
            if (getContenido() == "{")
            {
                if (evaluacion)
                {
                    //Console.WriteLine("_________Sí if: "+countelse);
                    BloqueInstrucciones(evaluacion);
                }
                else if (!evaluacion)
                {
                    countelse++;
                    //Console.WriteLine("_________No if: "+countelse);
                    BloqueInstrucciones(false);
                }
            }
            if (getContenido() == "else")
            {
                match("else");
                //Console.WriteLine("____Entraelse");
                if (getContenido() == "{")
                {
                    if (!evaluacion && (countelse <= 1))
                    {
                        countelse--;
                        //Console.WriteLine("_________Sí else: "+countelse);
                        BloqueInstrucciones(!evaluacion);

                    }
                    else if (!evaluacion && (countelse >= 2))
                    {
                        countelse--;
                        //Console.WriteLine("_________No else: "+countelse);
                        BloqueInstrucciones(false);
                    }
                    else if (evaluacion)
                    {
                        BloqueInstrucciones(false);
                    }
                }
            }


        }
        //Printf -> printf(cadena(,Identificador)?);
        private void Printf(bool ejecuta)
        {
            match("printf");
            match("(");

            if (ejecuta)
            {
                if (getClasificacion() == Tipos.Cadena)
                {
                    string nuevaCadena = getContenido().Substring(1, getContenido().Length - 2);
                    nuevaCadena = nuevaCadena.Replace("\\n", "\n").Replace("\\t", "\t");
                    Console.Write(nuevaCadena);
                }
            }
            match(Tipos.Cadena);

            if (getContenido() == ",")
            {
                match(",");
                string variable = getContenido();
                if (!Existe(variable))
                {
                    throw new Error("de sintaxis, la variable <" + variable + "> no está declarada", log, linea, columna);
                }
                stack.Push(getValor(variable));
                match(Tipos.Identificador);
                Console.Write(getValor(variable));
            }

            match(")");
            match(";");
        }
        //Scanf -> scanf(cadena,&Identificador);
        private void Scanf(bool ejecuta)
        {
            match("scanf");
            match("(");
            match(Tipos.Cadena);
            match(",");
            match("&");
            if (!Existe(getContenido()))
            {
                throw new Error("de sintaxis, la variable <" + getContenido() + "> no está declarada", log, linea, columna);
            }
            string variable = getContenido();
            match(Tipos.Identificador);
            if (ejecuta)
            {
                string captura = "" + Console.ReadLine();
                float resultado;
                if (!float.TryParse(captura, out resultado))
                {
                    throw new Error("de sintaxis, el valor ingresado no es un número", log, linea, columna);
                }
                resultado = float.Parse(captura);
                stack.Push(resultado);
                Modifica(variable, resultado);
            }
            match(")");
            match(";");
        }
        //Main -> void main() BloqueInstrucciones
        private void Main(bool ejecuta)
        {
            match("void");
            match("main");
            match("(");
            match(")");
            BloqueInstrucciones(ejecuta);
        }
        //Expresion -> Termino MasTermino
        private void Expresion()
        {
            Termino();
            MasTermino();
        }
        //MasTermino -> (OperadorTermino Termino)?
        private void MasTermino()
        {
            if (getClasificacion() == Tipos.OperadorTermino)
            {
                string operador = getContenido();
                match(Tipos.OperadorTermino);
                Termino();
                log.Write(" " + operador);
                float R2 = stack.Pop();
                float R1 = stack.Pop();
                if (operador == "+")
                {
                    stack.Push(R1 + R2);
                    float suma = R1 + R2;
                }
                else
                {
                    stack.Push(R1 - R2);
                    float resta = R1 - R2;
                }
            }
        }
        //Termino -> Factor PorFactor
        private void Termino()
        {
            Factor();
            PorFactor();
        }
        //PorFactor -> (OperadorFactor Factor)?
        private void PorFactor()
        {
            if (getClasificacion() == Tipos.OperadorFactor)
            {
                string operador = getContenido();
                match(Tipos.OperadorFactor);
                Factor();
                log.Write(" " + operador);
                float R2 = stack.Pop();
                float R1 = stack.Pop();

                if (operador == "*")
                {
                    float mult = R1 * R2;
                    stack.Push(R1 * R2);

                }
                else if (operador == "/")
                {
                    float div = R1 / R2;
                    stack.Push(R1 / R2);

                }
                else if (operador == "%")
                {
                    float residuo = R1 % R2;
                    stack.Push(R1 % R2);

                }
            }
        }
        //Factor -> numero | identificador | (Expresion)
        private void Factor()
        {
            if (getClasificacion() == Tipos.Numero)
            {
                log.Write(" " + getContenido());
                Console.WriteLine(getContenido() + " "+ float.Parse(getContenido()));
                stack.Push(float.Parse(getContenido()));
                match(Tipos.Numero);
            }
            else if (getClasificacion() == Tipos.Identificador)
            {
                string variable = getContenido();
                if (!Existe(variable))
                {
                    throw new Error("de sintaxis, la variable <" + variable + "> no está declarada", log, linea, columna);
                }
                stack.Push(getValor(variable));
                match(Tipos.Identificador);
            }
            else
            {
                match("(");
                Expresion();
                match(")");
            }
        }
    }
}