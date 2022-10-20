class Empleado{
    int _id;
    String _nombre;
    double _salario;

    Empleado(this._id, this._nombre, this._salario);

    set id(int id){
      this._id = id;
    }

    set nombre(String nombre){
      this._nombre = nombre;
    }

    set salario(double salario){
      this._salario = salario;  
    }

    int get id => this._id;
    String get nombre => this._nombre;
    double get salario => this._salario;
}