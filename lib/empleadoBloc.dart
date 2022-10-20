import 'dart:async';
import 'empleado.dart';

class EmpleadoBloc{
    List<Empleado> _empleadoList = [
      Empleado(1, "Empleado 1", 1000.0),
      Empleado(2, "Empleado 2", 2000.0),
      Empleado(3, "Empleado 3", 3000.0),
      Empleado(4, "Empleado 4", 4000.0),
      Empleado(5, "Empleado 5", 5000.0),
    ];

    final _empleadoListStreamController = StreamController<List<Empleado>>();

    
    final _empleadoIncrementStreamController = StreamController<Empleado>();
    final _empleadoDecrementStreamController = StreamController<Empleado>();


    Stream <List<Empleado>> get empleadoListStrem => _empleadoListStreamController.stream;
    StreamSink <List<Empleado>> get empleadoListSink => _empleadoListStreamController.sink;

    
    StreamSink <Empleado> get empleadoSalarioIncrement => _empleadoIncrementStreamController.sink;
    StreamSink <Empleado> get empleadoSalarioDecrement => _empleadoDecrementStreamController.sink;

    EmpleadoBloc(){
      _empleadoListStreamController.add(_empleadoList);
      _empleadoIncrementStreamController.stream.listen(_incrementSalario);
      _empleadoDecrementStreamController.stream.listen(_decrementSalario);
    }

    _incrementSalario(Empleado empleado){
      double actual = empleado.salario;
      double aumento = actual * 20/100;

      _empleadoList[empleado.id - 1].salario = actual + aumento;
      empleadoListSink.add(_empleadoList);
    }

    _decrementSalario(Empleado empleado){
      double actual = empleado.salario;
      double aumento = actual * 20/100;

      _empleadoList[empleado.id - 1].salario = actual - aumento;
      empleadoListSink.add(_empleadoList);
    }

    void dispose(){
      _empleadoIncrementStreamController.close();
      _empleadoDecrementStreamController.close();
      _empleadoListStreamController.close();

    }
}