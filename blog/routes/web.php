<?php

use App\Http\Controllers\CategoryController;
use App\Http\Controllers\PostController;
use App\Http\Controllers\ProfileController;
use Illuminate\Support\Facades\Route;

Route::get('/', function () {
    return view('welcome');
});

Route::get('/dashboard', [CategoryController::class, 'index'])->middleware(['auth', 'verified'])->name('dashboard');

Route::resource('post',(PostController::class));
Route::post('post/newsletter', [PostController::class, 'storenewsletter'])->name('post.storenewsletter');
Route::get('/posts/{post}', [PostController::class, 'show'])->name('posts.show');
Route::post('/posts/{post}/comments', [PostController::class, 'store_comment'])->name('posts.store_comment');

Route::get('category/{id}/posts', [PostController::class, 'postsByCategory'])->name('category.posts');

Route::middleware('auth')->group(function () {
    Route::get('/profile', [ProfileController::class, 'edit'])->name('profile.edit');
    Route::patch('/profile', [ProfileController::class, 'update'])->name('profile.update');
    Route::delete('/profile', [ProfileController::class, 'destroy'])->name('profile.destroy');
});

require __DIR__.'/auth.php';
