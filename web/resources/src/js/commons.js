function formCreate(fn) {
    let form = document.createElement("form")
    fn(form);
    console.log(form);
    document.body.append(form);
    form.submit();
}