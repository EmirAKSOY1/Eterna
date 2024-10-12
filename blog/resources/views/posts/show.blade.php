{{-- resources/views/posts/show.blade.php --}}

@extends('layouts.app')

@section('content')
    <header class="page-header page-header-mini">
        <h1 class="title">{{$post->title}}</h1>
        <ol class="breadcrumb pb-0">
            <li class="breadcrumb-item"><a href="/dashboard">Home</a></li>
            <li class="breadcrumb-item active" aria-current="page">{{$post->title}}</li>
        </ol>
    </header>
    <!-- End Of Page Header -->

    <section class="container">
        <div class="page-container">
            <div class="page-content">
                <div class="card">
                    <div class="card-header pt-0">
                        <h3 class="card-title mb-4">{{$post->title}}</h3>
                        <div class="d-flex justify-content-center">
                        <img class="img-fluid" src="{{asset($post->image_path)}}" alt="" style="height:500px;width: 800px">
                        </div>
                            <div class="blog-media mb-4">
                            <img src="assets/imgs/blog-6.jpg" alt="" class="w-100">
                            <a href="#" class="badge badge-primary">#{{$post->category->name}}</a>
                        </div>
                        <small class="small text-muted">
                            <a href="#" class="text-muted">{{$post->user->name}}</a>
                            <span class="px-2">·</span>
                            <span>{{$post->created_at}}</span>
                        </small>
                    </div>
                    <div class="card-body border-top">
                        {!! $post->body !!}
                    </div>

                    <div class="card-footer">
                        <h6 class="mt-5 mb-3 text-center"><a href="#" class="text-dark">Comments</a></h6>
                        <hr>
                        @foreach($post->comments as $comment)
                        <div class="media mt-5">
                            @if ($comment->user->profile_photo_path)
                                <img src="{{ asset($comment->user->profile_photo_path) }}" class="mr-3 thumb-sm rounded-circle" alt="...">
                            @else
                                <img src="https://e7.pngegg.com/pngimages/492/286/png-clipart-computer-icons-user-profile-avatar-avatar-heroes-monochrome.png" class="mr-3 thumb-sm rounded-circle" alt="...">
                            @endif

                            <div class="media-body">
                                <h6 class="mt-0">{{$comment->user->name}}<span style="font-size: small">({{$comment->created_at}})<span></span></h6>
                                <p>{{$comment->content}}</p>
                            </div>
                        </div>
                        @endforeach


                        <h6 class="mt-5 mb-3 text-center"><a href="#" class="text-dark">Write Your Comment</a></h6>
                        <hr>
                        <form action="{{route('posts.store_comment', $post->id) }}" method="POST">
                            @csrf
                            <div class="form-row">
                                <div class="col-12 form-group">
                                    <textarea name="comment" id="" cols="30" rows="10" class="form-control" placeholder="Enter Your Comment Here"></textarea>
                                </div>
                                <div class="form-group col-12">
                                    <button class="btn btn-primary btn-block">Post Comment</button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>

                <h6 class="mt-5 text-center">Related Posts</h6>
                <hr>
                <div class="row">
                    <div class="col-md-6 col-lg-4">
                        <div class="card mb-5">
                            <div class="card-header p-0">
                                <div class="blog-media">
                                    <img src="assets/imgs/blog-2.jpg" alt="" class="w-100">
                                    <a href="#" class="badge badge-primary">#Placeat</a>
                                </div>
                            </div>
                            <div class="card-body px-0">
                                <h6 class="card-title mb-2"><a href="#" class="text-dark">Voluptates Corporis Placeat</a></h6>
                                <small class="small text-muted">January 20 2019
                                    <span class="px-2">-</span>
                                    <a href="#" class="text-muted">34 Comments</a>
                                </small>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6 col-lg-4">
                        <div class="card mb-5">
                            <div class="card-header p-0">
                                <div class="blog-media">
                                    <img src="assets/imgs/blog-3.jpg" alt="" class="w-100">
                                    <a href="#" class="badge badge-primary">#dolores</a>
                                </div>
                            </div>
                            <div class="card-body px-0">
                                <h6 class="card-title mb-2"><a herf="#" class="text-dark">Dolorum Dolores Itaque</a></h6>
                                <small class="small text-muted">January 19 2019
                                    <span class="px-2">-</span>
                                    <a href="#" class="text-muted">64 Comments</a>
                                </small>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6 col-lg-4 d-none d-lg-block">
                        <div class="card mb-5">
                            <div class="card-header p-0">
                                <div class="blog-media">
                                    <img src="assets/imgs/blog-4.jpg" alt="" class="w-100">
                                    <a href="#" class="badge badge-primary">#amet</a>
                                </div>
                            </div>
                            <div class="card-body px-0">
                                <h6 class="card-title mb-2">Quisquam Dignissimos</h6>
                                <small class="small text-muted">January 17 2019
                                    <span class="px-2">-</span>
                                    <a href="#" class="text-muted">93 Comments</a>
                                </small>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

        </div>
    </section>
<!-- Page Footer -->
    <footer class="page-footer">
        <div class="container">

            <p class="border-top mb-0 mt-4 pt-3 small">&copy; <script>document.write(new Date().getFullYear())</script>, JoeBlog Created By <a href="https://www.devcrud.com" class="text-muted font-weight-bold" target="_blank">DevCrud.</a>  All rights reserved </p>
        </div>
    </footer>
@endsection
