const URL = "http://localhost:8080/autos";

// Referencias
const tabla = document.querySelector("#tabla-autos tbody");
const mensaje = document.getElementById("mensaje");

// FORMULARIO CREAR
const formCrear = document.getElementById("form-crear");

// MODAL EDITAR
const modalEditar = new bootstrap.Modal(document.getElementById("modalEditar"));
const formEditar = document.getElementById("form-editar");

// ===================
// MENSAJES
// ===================
function mostrarMensaje(texto, tipo) {
    mensaje.className = `alert alert-${tipo}`;
    mensaje.textContent = texto;
    mensaje.classList.remove("d-none");
    setTimeout(() => mensaje.classList.add("d-none"), 3000);
}

// ===================
// CARGAR AUTOS
// ===================
async function cargarAutos() {
    try {
        const resp = await axios.get(`${URL}/traer`);
        const autos = resp.data;

        tabla.innerHTML = "";
        autos.forEach(a => {
            tabla.innerHTML += `
                <tr>
                    <td>${a.id}</td>
                    <td>${a.marca}</td>
                    <td>${a.precio}</td>
                    <td>
                        <button class="btn btn-warning btn-sm" onclick="abrirModalEditar(${a.id}, '${a.marca}', ${a.precio})">✏️ Editar</button>
                        <button class="btn btn-danger btn-sm" onclick="eliminarAuto(${a.id})">🗑️ Eliminar</button>
                    </td>
                </tr>
            `;
        });

    } catch (err) {
        mostrarMensaje("Error al cargar autos", "danger");
    }
}

document.addEventListener("DOMContentLoaded", cargarAutos);

// ===================
// CREAR AUTO
// ===================
formCrear.addEventListener("submit", async e => {
    e.preventDefault();

    const marca = document.getElementById("marca").value;
    const precio = document.getElementById("precio").value;

    try {
        await axios.post(`${URL}/crear`, { marca, precio });
        mostrarMensaje("Auto creado correctamente", "success");
        formCrear.reset();
        cargarAutos();
    } catch (err) {
        mostrarMensaje("Error al crear auto", "danger");
    }
});

// ===================
// ABRIR MODAL EDITAR
// ===================
function abrirModalEditar(id, marca, precio) {
    document.getElementById("edit-id").value = id;
    document.getElementById("edit-marca").value = marca;
    document.getElementById("edit-precio").value = precio;

    modalEditar.show();
}

// ===================
// EDITAR AUTO
// ===================
formEditar.addEventListener("submit", async e => {
    e.preventDefault();

    const id = document.getElementById("edit-id").value;
    const marca = document.getElementById("edit-marca").value;
    const precio = document.getElementById("edit-precio").value;

    try {
        await axios.put(`${URL}/editar/${id}`, { marca, precio });
        mostrarMensaje("Auto modificado correctamente", "success");

        modalEditar.hide();
        cargarAutos();
    } catch (err) {
        mostrarMensaje("Error al modificar auto", "danger");
    }
});

// ===================
// ELIMINAR AUTO
// ===================
async function eliminarAuto(id) {
    const confirmar = confirm("¿Seguro que deseas eliminar este auto?");
    if (!confirmar) return;

    try {
        await axios.delete(`${URL}/eliminar/${id}`);
        mostrarMensaje("Auto eliminado", "success");
        cargarAutos();
    } catch (err) {
        mostrarMensaje("Error al eliminar auto", "danger");
    }
}
