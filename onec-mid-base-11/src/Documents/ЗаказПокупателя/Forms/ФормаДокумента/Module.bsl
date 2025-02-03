
#Область ОбработчикиСобытийФормы

&НаСервере
Процедура ПриСозданииНаСервере(Отказ, СтандартнаяОбработка)
	
	// СтандартныеПодсистемы.ПодключаемыеКоманды
	ПодключаемыеКоманды.ПриСозданииНаСервере(ЭтотОбъект);
	// Конец СтандартныеПодсистемы.ПодключаемыеКоманды
	
	// ++ Алькин В.А. Задание к занятию Внесение изменений в конфигурацию на поддержке, Задача 2 от 05.10.2024
	ГруппаСкидка = Элементы.Добавить("ГруппаСкидка", Тип("ГруппаФормы"), Элементы.ГруппаШапкаЛево);
	ГруппаСкидка.Вид = ВидГруппыФормы.ОбычнаяГруппа;
	ГруппаСкидка.ОтображатьЗаголовок = Ложь;
		
	ПолеВвода = Элементы.Добавить("ДК_СогласованнаяСкидка", Тип("ПолеФормы"), ГруппаСкидка);
	ПолеВвода.Вид = ВидПоляФормы.ПолеВвода;
	ПолеВвода.ПутьКДанным = "Объект.ДК_СогласованнаяСкидка";                
	ПолеВвода.УстановитьДействие("ПриИзменении", "ДК_СогласованнаяСкидкаПриИзменении");
	
	Команда = Команды.Добавить("ДК_ПересчитатьТаблицу");
	Команда.Заголовок = "Пересчитать таблицу";
	КартинкаПеречитать = БиблиотекаКартинок.Перечитать;
	Команда.Картинка = КартинкаПеречитать;
	Команда.Отображение = ОтображениеКнопки.КартинкаИТекст;
	Команда.Действие = "КомандаДК_ПересчитатьТаблицу";
	
	КнопкаФормы = Элементы.Добавить("ДК_ПересчитатьТаблицу", Тип("КнопкаФормы"), ГруппаСкидка);
	КнопкаФормы.Вид = ВидКнопкиФормы.ОбычнаяКнопка;
	КнопкаФормы.ИмяКоманды = "ДК_ПересчитатьТаблицу";
	// -- Алькин В.А. Задание к занятию Внесение изменений в конфигурацию на поддержке, Задача 2 от 05.10.2024
	
КонецПроцедуры

&НаКлиенте
Процедура ПриОткрытии(Отказ)
	
    // СтандартныеПодсистемы.ПодключаемыеКоманды
    ПодключаемыеКомандыКлиент.НачатьОбновлениеКоманд(ЭтотОбъект);
    // Конец СтандартныеПодсистемы.ПодключаемыеКоманды
	
КонецПроцедуры

&НаСервере
Процедура ПриЧтенииНаСервере(ТекущийОбъект)
	
    // СтандартныеПодсистемы.ПодключаемыеКоманды
    ПодключаемыеКомандыКлиентСервер.ОбновитьКоманды(ЭтотОбъект, Объект);
    // Конец СтандартныеПодсистемы.ПодключаемыеКоманды
	
КонецПроцедуры

&НаКлиенте
Процедура ПослеЗаписи(ПараметрыЗаписи)
    ПодключаемыеКомандыКлиент.ПослеЗаписи(ЭтотОбъект, Объект, ПараметрыЗаписи);
КонецПроцедуры

#КонецОбласти

#Область ОбработчикиСобытийЭлементовШапкиФормы

&НаКлиенте
Процедура ДК_СогласованнаяСкидкаПриИзменении()
	
	// ++ Алькин В.А. Задание к занятию Внесение изменений в конфигурацию на поддержке, Задача 2 от 05.10.2024
	ДК_СогласованнаяСкидкаПриИзмененииАсинх()
	// -- Алькин В.А. Задание к занятию Внесение изменений в конфигурацию на поддержке, Задача 2 от 05.10.2024
	
КонецПроцедуры

#КонецОбласти

#Область ОбработчикиСобытийЭлементовТаблицыФормыТовары

&НаКлиенте
Процедура ТоварыКоличествоПриИзменении(Элемент)
	
	ТекущиеДанные = Элементы.Товары.ТекущиеДанные;
	
	РассчитатьСуммуСтроки(ТекущиеДанные);
	
КонецПроцедуры

&НаКлиенте
Процедура ТоварыЦенаПриИзменении(Элемент)
	
	ТекущиеДанные = Элементы.Товары.ТекущиеДанные;
	
	РассчитатьСуммуСтроки(ТекущиеДанные);
	
КонецПроцедуры

&НаКлиенте
Процедура ТоварыПриИзменении(Элемент)
	РассчитатьСуммуДокумента();
КонецПроцедуры

&НаКлиенте
Процедура ТоварыСкидкаПриИзменении(Элемент)
	
	ТекущиеДанные = Элементы.Товары.ТекущиеДанные;
	
	РассчитатьСуммуСтроки(ТекущиеДанные);
	
КонецПроцедуры

#КонецОбласти

#Область ОбработчикиСобытийЭлементовТаблицыФормыУслуги

&НаКлиенте
Процедура УслугиКоличествоПриИзменении(Элемент)
	
	ТекущиеДанные = Элементы.Услуги.ТекущиеДанные;
	
	РассчитатьСуммуСтроки(ТекущиеДанные);
	
КонецПроцедуры

&НаКлиенте
Процедура УслугиЦенаПриИзменении(Элемент)
	
	ТекущиеДанные = Элементы.Услуги.ТекущиеДанные;
	
	РассчитатьСуммуСтроки(ТекущиеДанные);
	
КонецПроцедуры

&НаКлиенте
Процедура УслугиСкидкаПриИзменении(Элемент)
	
	ТекущиеДанные = Элементы.Услуги.ТекущиеДанные;
	
	РассчитатьСуммуСтроки(ТекущиеДанные);
	
КонецПроцедуры

&НаКлиенте
Процедура УслугиПриИзменении(Элемент)
	РассчитатьСуммуДокумента();
КонецПроцедуры

#КонецОбласти

#Область ОбработчикиКомандФормы 

&НаКлиенте
Процедура КомандаДК_ПересчитатьТаблицу(Команда)
	
	// ++ Алькин В.А. Задание к занятию Внесение изменений в конфигурацию на поддержке, Задача 2 от 06.10.2024
    ДК_ПерезаполнитьДанныеТабличныхЧастей(Объект.Товары);
	ДК_ПерезаполнитьДанныеТабличныхЧастей(Объект.Услуги);
	// -- Алькин В.А. Задание к занятию Внесение изменений в конфигурацию на поддержке, Задача 2 от 06.10.2024
	
КонецПроцедуры

#КонецОбласти

#Область СлужебныеПроцедурыИФункции

&НаКлиенте
Процедура РассчитатьСуммуСтроки(ТекущиеДанные)
	
	// ++ Алькин В.А. Задание к занятию Внесение изменений в конфигурацию на поддержке, Задача 2 от 06.10.2024
	// КоэффициентСкидки = 1 - ТекущиеДанные.Скидка / 100;
	// ТекущиеДанные.Сумма = ТекущиеДанные.Цена * ТекущиеДанные.Количество * КоэффициентСкидки;
	ТекущиеДанные.Сумма = ТекущиеДанные.Цена * ТекущиеДанные.Количество * (100 - Объект.ДК_СогласованнаяСкидка) / 100;
	РассчитатьСуммуДокумента();
	// -- Алькин В.А. Задание к занятию Внесение изменений в конфигурацию на поддержке, Задача 2 от 06.10.2024	
	
КонецПроцедуры

&НаКлиенте
Процедура РассчитатьСуммуДокумента()
	
	Объект.СуммаДокумента = Объект.Товары.Итог("Сумма") + Объект.Услуги.Итог("Сумма");
	
КонецПроцедуры

&НаКлиенте
Асинх Процедура ДК_СогласованнаяСкидкаПриИзмененииАсинх()
	
	// ++ Алькин В.А. Задание к занятию Внесение изменений в конфигурацию на поддержке, Задача 2 от 06.10.2024
	ТаблицаЗаполнена = ПолучитьДанныеТаблицы();
	Если ТаблицаЗаполнена Тогда 
		Текст = "Изменен процент скидки. Пересчитать таблицы товаров и услуг?";
		Режим = РежимДиалогаВопрос.ДаНет;	
		Вопрос = Ждать ВопросАсинх(Текст, Режим);
		Если Вопрос = КодВозвратаДиалога.Да Тогда
			ДК_ПерезаполнитьДанныеТабличныхЧастей(Объект.Товары);
			ДК_ПерезаполнитьДанныеТабличныхЧастей(Объект.Услуги);
		КонецЕсли;
	КонецЕсли;
	// -- Алькин В.А. Задание к занятию Внесение изменений в конфигурацию на поддержке, Задача 2 от 06.10.2024
	
КонецПроцедуры

&НаСервере
Функция ПолучитьДанныеТаблицы()
	
	// ++ Алькин В.А. Задание к занятию Внесение изменений в конфигурацию на поддержке, Задача 2 от 06.10.2024
	Если Объект.Товары.Количество() > 0 Или Объект.Услуги.Количество() > 0 Тогда
		ТаблицаЗаполнена = Истина;
	Иначе
		ТаблицаЗаполнена = Ложь;
	КонецЕсли;
	
	Возврат ТаблицаЗаполнена;
	// -- Алькин В.А. Задание к занятию Внесение изменений в конфигурацию на поддержке, Задача 2 от 06.10.2024
	
КонецФункции

&НаКлиенте
Процедура ДК_ПерезаполнитьДанныеТабличныхЧастей(ТабличнаяЧасть) 
	
	// ++ Алькин В.А. Задание к занятию Внесение изменений в конфигурацию на поддержке, Задача 2 от 06.10.2024
	Для Каждого Значение Из ТабличнаяЧасть Цикл
		
		Значение.Сумма = Значение.Количество * Значение.Цена * (100 - Объект.ДК_СогласованнаяСкидка) / 100;	
		
	КонецЦикла;
	
	РассчитатьСуммуДокумента();
	// -- Алькин В.А. Задание к занятию Внесение изменений в конфигурацию на поддержке, Задача 2 от 06.10.2024
	
КонецПроцедуры

#Область ПодключаемыеКоманды

// СтандартныеПодсистемы.ПодключаемыеКоманды
&НаКлиенте
Процедура Подключаемый_ВыполнитьКоманду(Команда)
    ПодключаемыеКомандыКлиент.НачатьВыполнениеКоманды(ЭтотОбъект, Команда, Объект);
КонецПроцедуры

&НаКлиенте
Процедура Подключаемый_ПродолжитьВыполнениеКомандыНаСервере(ПараметрыВыполнения, ДополнительныеПараметры) Экспорт
    ВыполнитьКомандуНаСервере(ПараметрыВыполнения);
КонецПроцедуры

&НаСервере
Процедура ВыполнитьКомандуНаСервере(ПараметрыВыполнения)
    ПодключаемыеКоманды.ВыполнитьКоманду(ЭтотОбъект, ПараметрыВыполнения, Объект);
КонецПроцедуры

&НаКлиенте
Процедура Подключаемый_ОбновитьКоманды()
    ПодключаемыеКомандыКлиентСервер.ОбновитьКоманды(ЭтотОбъект, Объект);
КонецПроцедуры
// Конец СтандартныеПодсистемы.ПодключаемыеКоманды

#КонецОбласти

#КонецОбласти
