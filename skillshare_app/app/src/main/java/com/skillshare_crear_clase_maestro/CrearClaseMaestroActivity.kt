package com.skillshare.crear_clase_maestro

import android.os.Bundle
import android.widget.ArrayAdapter
import android.widget.Button
import android.widget.EditText
import android.widget.Spinner
import android.widget.Toast
import androidx.appcompat.app.AppCompatActivity
import com.google.android.material.datepicker.MaterialDatePicker
import com.google.android.material.timepicker.MaterialTimePicker
import com.google.android.material.timepicker.TimeFormat
import java.text.NumberFormat
import java.text.SimpleDateFormat
import java.util.Calendar
import java.util.Locale

class CrearClaseMaestroActivity : AppCompatActivity() { // Nombre de la clase actualizado

    private lateinit var editTextTitle: EditText
    private lateinit var editTextDescription: EditText
    private lateinit var spinnerCategory: Spinner
    private lateinit var editTextPrice: EditText
    private lateinit var editTextDate: EditText
    private lateinit var editTextTime: EditText
    private lateinit var buttonCreateClass: Button

    private var selectedCalendar: Calendar = Calendar.getInstance()

    // Rangos de precio y horario
    private val MIN_PRICE = 20000.0
    private val MAX_PRICE = 100000.0
    private val MIN_HOUR = 8 // 8 AM
    private val MAX_HOUR = 20 // 8 PM (20:00)

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_crear_clase_maestro)

        editTextTitle = findViewById(R.id.editTextTitle)
        editTextDescription = findViewById(R.id.editTextDescription)
        spinnerCategory = findViewById(R.id.spinnerCategory)
        editTextPrice = findViewById(R.id.editTextPrice)
        editTextDate = findViewById(R.id.editTextDate)
        editTextTime = findViewById(R.id.editTextTime)
        buttonCreateClass = findViewById(R.id.buttonCreateClass)

        setupCategorySpinner()
        setupDateTimePickers()

        buttonCreateClass.setOnClickListener {
            createClass()
        }
    }

    private fun setupCategorySpinner() {
        val categories = arrayOf(
            "Selecciona una Categoría",
            "Artesanía",
            "Idiomas",
            "Tecnología",
            "Música",
            "Cocina",
            "Deportes",
            "Fotografía",
            "Otros"
        )
        val adapter = ArrayAdapter(this, android.R.layout.simple_spinner_item, categories)
        adapter.setDropDownViewResource(android.R.layout.simple_spinner_dropdown_item)
        spinnerCategory.adapter = adapter
    }

    private fun setupDateTimePickers() {
        val dateFormat = SimpleDateFormat("dd/MM/yyyy", Locale.getDefault())
        val timeFormat = SimpleDateFormat("hh:mm a", Locale.getDefault()) // O HH:mm para 24h

        // Selector de Fecha
        editTextDate.setOnClickListener {
            val datePicker = MaterialDatePicker.Builder.datePicker()
                .setTitleText("Selecciona la fecha de la clase")
                .setSelection(selectedCalendar.timeInMillis)
                .build()

            datePicker.addOnPositiveButtonClickListener { selection ->
                val tempCalendar = Calendar.getInstance()
                tempCalendar.timeInMillis = selection

                // Validar que la fecha sea de lunes a viernes
                val dayOfWeek = tempCalendar.get(Calendar.DAY_OF_WEEK)
                if (dayOfWeek == Calendar.SATURDAY || dayOfWeek == Calendar.SUNDAY) {
                    Toast.makeText(this, "Las clases solo pueden ser de Lunes a Viernes.", Toast.LENGTH_LONG).show()
                    editTextDate.setText("") // Limpiar campo si no es válido
                    return@addOnPositiveButtonClickListener // Sale del listener
                }

                selectedCalendar.timeInMillis = selection
                editTextDate.setText(dateFormat.format(selectedCalendar.time))
            }
            datePicker.show(supportFragmentManager, "MATERIAL_DATE_PICKER")
        }

        // Selector de Hora
        editTextTime.setOnClickListener {
            val timePicker = MaterialTimePicker.Builder()
                .setTimeFormat(TimeFormat.CLOCK_12H) // O CLOCK_24H
                .setHour(selectedCalendar.get(Calendar.HOUR_OF_DAY))
                .setMinute(selectedCalendar.get(Calendar.MINUTE))
                .setTitleText("Selecciona la hora de la clase")
                .build()

            timePicker.addOnPositiveButtonClickListener {
                val hour = timePicker.hour
                val minute = timePicker.minute

                // Validar rango de hora (8 AM a 8 PM)
                if (hour < MIN_HOUR || hour > MAX_HOUR) {
                    Toast.makeText(this, "Las clases deben ser entre las 8 AM y las 8 PM.", Toast.LENGTH_LONG).show()
                    editTextTime.setText("") // Limpiar campo si no es válido
                    return@addOnPositiveButtonClickListener // Sale del listener
                }
                // Si la hora es 8 PM (20:00), no permitir minutos si no es la hora exacta
                if (hour == MAX_HOUR && minute > 0) {
                    Toast.makeText(this, "La hora límite es 8 PM (20:00).", Toast.LENGTH_LONG).show()
                    editTextTime.setText("") // Limpiar campo si no es válido
                    return@addOnPositiveButtonClickListener
                }

                selectedCalendar.set(Calendar.HOUR_OF_DAY, hour)
                selectedCalendar.set(Calendar.MINUTE, minute)

                editTextTime.setText(timeFormat.format(selectedCalendar.time))
            }
            timePicker.show(supportFragmentManager, "MATERIAL_TIME_PICKER")
        }
    }

    private fun createClass() {
        val title = editTextTitle.text.toString().trim()
        val description = editTextDescription.text.toString().trim()
        val category = spinnerCategory.selectedItem.toString()
        val priceString = editTextPrice.text.toString().trim()
        val date = editTextDate.text.toString().trim()
        val time = editTextTime.text.toString().trim()

        // Validaciones de campos vacíos
        if (title.isEmpty()) {
            editTextTitle.error = "El título es obligatorio"
            return
        }
        if (description.isEmpty()) {
            editTextDescription.error = "La descripción es obligatoria"
            return
        }
        if (category == "Selecciona una Categoría") {
            Toast.makeText(this, "Por favor, selecciona una categoría", Toast.LENGTH_SHORT).show()
            return
        }
        if (priceString.isEmpty()) {
            editTextPrice.error = "El precio es obligatorio"
            return
        }
        if (date.isEmpty()) {
            editTextDate.error = "La fecha es obligatoria"
            return
        }
        if (time.isEmpty()) {
            editTextTime.error = "La hora es obligatoria"
            return
        }


        val price = priceString.toDoubleOrNull()
        if (price == null || price < MIN_PRICE || price > MAX_PRICE) {
            editTextPrice.error = "Ingresa un precio entre ${NumberFormat.getCurrencyInstance(Locale("es", "CO")).format(MIN_PRICE)} y ${NumberFormat.getCurrencyInstance(Locale("es", "CO")).format(MAX_PRICE)}"
            return
        }

        val classDetails = """
            Clase Registrada:
            Título: $title
            Descripción: $description
            Categoría: $category
            Precio: ${NumberFormat.getCurrencyInstance(Locale("es", "CO")).format(price)}
            Fecha: $date
            Hora: $time
        """.trimIndent()

        Toast.makeText(this, classDetails, Toast.LENGTH_LONG).show()

    }
}