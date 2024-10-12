@extends('layouts.app')

@section('content')
    <br>
    <div class="container">
        <h1 style="color: #4070f4">New Post</h1>
        <form action="{{ route('post.store') }}" method="POST" enctype="multipart/form-data" >
            @csrf
        <div class="mb-3">
            <label for="exampleFormControlInput1" class="form-label">Title</label>
            <input type="text" class="form-control" name="title" id="exampleFormControlInput1" >
        </div>
        <div class="mb-3">
            <label for="exampleFormControlTextarea1" class="form-label">Content</label>
            <textarea class="form-control" id="body" name="body" rows="3"></textarea>
        </div>
        <div class="mb-3">
            <label for="exampleFormControlTextarea1" class="form-label">Category</label>
            <select class="form-control" name="category_id" id="category">
                <option value="">Select</option>
                @foreach($categories as $category)
                    <option value="{{ $category->id }}">{{ $category->name }}</option>
                @endforeach
            </select>
        </div>
        <div class="mb-3">
            <label for="formFile" class="form-label">Image</label>
            <input class="form-control" type="file" id="formFile" name="file" accept=".jpg,.jpeg,.png">
        </div>
        <div class="mb-3">
            <button type="submit" class="btn btn-primary mb-3">Submit Post</button>
        </div>
        </form>
    </div>
    <script src="https://cdn.ckeditor.com/ckeditor5/34.1.0/classic/ckeditor.js"></script>
    <script>
        ClassicEditor
            .create(document.querySelector('#body'))
            .catch(error => {
                console.error(error);
            });
    </script>
@endsection
