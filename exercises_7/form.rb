class Form
  def initialize
    @stations = {}
    @routes = {} 
    @trains = {}
  end
  
  def menu
    until select == 0
        puts "Введите номер желаемого действия:
         1. Создание станции
         2. Создание маршрута
         3. Создание грузового поезда
         4. Создание пассажирского поезда
         5. Прицепить вагоны к поезду
         6. Отцепить вагоны от поезда
         7. Добавить поезда на станцию
         8. Загрузить вагон
         9. Разгрузить вагон
         10. Показать список станций
         11. Показать список поездов на станции
          0. Завершение программы"

         select = gets.to_i
          
          case select
          
            when 1
              create_station
            when 2
              create_route
            when 3
              create_cargo_train
            when 4
              create_passenger_train
            when 5
              hook_railcars
            when 6
              unhook_railcars
            when 7
              add_train_to_station
            when 8
              load_railcar
            when 9
              unload_railcar
            when 10
              show_station
            when 11
              show_trains
            else
              puts "Неверный ввод"
          end
    end
  end
  
  private
  attr_accessor :stations, :routes, :trains
  
  def create_station
    print "Имя станции:"
      name = gets.chomp
      stations[name.to_sym] = Station.new(name)
    rescue StandardError => e
      e.message
      e.backtrace
  end

  def create_route
    print "Имя маршрута:"
    name = gets.chomp
    puts "Имя начальной станции"
    name_1 = gets.chomp.to_sym
    puts "Имя конечной станции"
    name_2 = gets.chomp.to_sym
    routes[name.to_sym] = Route.new(name, stations[name_1], stations[name_2]) 
    rescue StandardError => e
      e.message
      e.backtrace
    end

    puts "Какие станции включить в маршрут? Для выхода введите 0"
      until number == 0
        name_station = gets.chomp.to_sym
        begin
          routes[name.to_sym].point_in(stations[name_station]) 
        rescue StandardError => e
        e.message
        e.backtrace
        end
      end
  end



  def create_cargo_train
    puts "Номер грузового поезда:"
    number = gets.chomp
    trains[number.to_sym] << CargoTrain.new(number)
    rescue StandardError => e
      e.message
      e.backtrace  
  end

  def create_passenger_train
    puts "Номер  пассажирского поезда:"
    number = gets.chomp
    trains[number.to_sym] << PsngrTrain.new(number)
    rescue StandardError => e
      e.message
      e.backtrace
  end

  def hook_railcars
    print "Введите номер поезда для прицепки вагонов:"
      number = gets.chomp.to_sym
      puts "Количество вагонов"
      count = gets.to_i
      count.times do 
        if train[number].type == "cargo"
          trains[number].railcar_hook(CargoRailcar.new)
        else
          trains[number].railcar_hook(PsngrRailcar.new)
        end
      end    
  end

  def unhook_railcars
    print "Введите номер поезда для отцепки вагонов:"
    number = gets.chomp.to_sym
    puts "Количество вагонов"
    count = gets.to_i
    count.times do 
      trains[number].railcar_unhook
    end
  end

  def add_train_to_station
    puts "Выбирете станцию"
    name = gets.chomp.to_sym  
    puts "Номер поезда"
    number = gets.chomp.to_sym
    stations[name].train_in(trains[number])  
  end

  def load_railcar
    print "Введите номер поезда для загрузки вагона:"
    number = gets.chomp.to_sym
    puts "Номер вагона"
    count = gets.to_i
    count -= 1
    railcar = trains[number].railcars[count]
    if car.type == "cargo"  
      puts "Количество груза для загрузки"
      load = gets.to_f
      railcar.load(cargo) 
    else
      puts "Количество человек для посадки"
      load = gets.to_i
      load.times{railcar.load}
      rescue StandardError => e
      e.message
      e.backtrace  
    end                                      
  end
  
  def unload_railcar
    print "Введите номер поезда для разгрузки вагона:"
    number = gets.chomp.to_sym
    puts "Номер вагона"
    count = gets.to_i
    count -= 1
    railcar = trains[number].railcars[count]
    if car.type == "cargo"  
      puts "Количество груза для разгрузки"
      load = gets.to_f
      railcar.unload(cargo)
    else
      puts "Количество человек для высадки"
      load = gets.to_i
      load.times{railcar.unload}  
    end
    rescue StandardError => e
      e.message
      e.backtrace         
  end

  def show_station
    puts "Будет показан список всех доступных станций"
    stations.each_key {|key| puts "#{name}"}
  end

  def show_trains           
    puts  "Будет показаны поезда на выбранной станции"          
    puts "Введите номер станции"
    number = gets.chomp.to_sym
    stations[number].show_train_tables
  end

end