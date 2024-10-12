@extends('layouts.app')
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
@section('content')
    @if($posts->count())
        <div class="container">
            <div class="page-container">
                <div class="page-content">
                    <div class="card">
                        <div class="card-header text-center">
                            <h5 class="card-title">{{ $category->name }} Category</h5>
                        </div>
                    </div>
                    <hr>
                    <div class="row" id="post-container">
                        @foreach($posts as $post)
                            <div class="col-lg-6">
                                <div class="card text-center mb-5">
                                    <div class="card-header p-0">
                                        <div class="blog-media">
                                            <img src="{{ asset($post->image_path) }}" alt="" class="w-100" style="height: 300px;width:85px">
                                            <a href="#" class="badge badge-primary">{{$post->category ? $post->category->name : 'Uncategorized'}}</a>
                                        </div>
                                    </div>
                                    <div class="card-body px-0">
                                        <h5 class="card-title mb-2">{{Str::limit($post->title, 40, '...') }}</h5>

                                        <small class="small text-muted">{{ $post->created_at->format('F j, Y') }}
                                            <span class="px-2">-</span>
                                            <a href="#" class="text-muted">{{ $post->user->name }}</a>
                                        </small>
                                    </div>
                                    <div class="card-footer p-0 text-center">
                                        <a href="{{ route('posts.show', $post->id) }}" class="btn btn-outline-dark btn-sm">READ MORE</a>
                                    </div>
                                </div>
                            </div>
                        @endforeach
                    </div>

                </div>

            </div>
        </div>

        <div class="pagination" style="display: flex; justify-content: center;">
            {{ $posts->links('pagination::simple-bootstrap-4') }}
        </div>
    @else
        <p>Bu kategoride henüz yazı bulunmamaktadır.</p>
    @endif
@endsection
